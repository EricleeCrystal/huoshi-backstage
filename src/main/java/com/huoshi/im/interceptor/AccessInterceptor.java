package com.huoshi.im.interceptor;

import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;
import org.slf4j.Logger;
import com.huoshi.im.util.LogUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 打印访问日志
 * 
 * @author LiBin
 * @date 2014-4-26 下午5:38:24
 */
@SuppressWarnings("serial")
public class AccessInterceptor extends AbstractInterceptor {

    private Logger logger = LogUtil.getLogger("access");

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        ActionContext context = invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) context.get(StrutsStatics.HTTP_REQUEST);
        /** 因为是从nginx跳转过来的 所以获取远程IP不能直接用getRemoteAddr */
        String remoteAddr = request.getHeader("X-Real-IP");
        if (EmptyUtil.isEmpty(remoteAddr)) {
            remoteAddr = request.getRemoteAddr();
        }

        Map<String, Object> params = invocation.getInvocationContext().getParameters();
        String uri = request.getRequestURI();
        if (request.getMethod().equalsIgnoreCase("GET")) {
            StringBuilder sb = new StringBuilder();
            for (Entry<String, Object> entry : params.entrySet()) {
                String value = ((Object[]) entry.getValue())[0].toString();
                sb.append(entry.getKey()).append("=").append(value).append("&");
            }
            if (sb.length() > 0) {
                uri += ("?" + sb.substring(0, sb.length() - 1));
            }
            logger.debug("host:[{}]  request method:[{}]  uri:[{}]", remoteAddr, request.getMethod(), uri);
        } else {
            StringBuilder sb = new StringBuilder();
            for (Entry<String, Object> entry : params.entrySet()) {
                String key = entry.getKey();
                if (key.equalsIgnoreCase("imei") || key.equalsIgnoreCase("userId")) {
                    sb.append(key).append("=").append(((Object[]) entry.getValue())[0].toString()).append("&");
                }
            }
            if (sb.length() > 0) {
                uri += ("?" + sb.substring(0, sb.length() - 1));
            }
            logger.debug("host:[{}]  request method:[{}]  uri:[{}]", remoteAddr, request.getMethod(), uri);
        }
        return invocation.invoke();
    }
}
