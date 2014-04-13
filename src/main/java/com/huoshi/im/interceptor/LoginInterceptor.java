package com.huoshi.im.interceptor;

import java.util.Map;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登录拦截器
 * 
 * @author: Ericlee
 * @date:2014-04-13 16:57:49
 */
@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        // 如果是windows环境 表明是测试环境 不需要登录
        if (EnvUtil.isWindows()) {
            return invocation.invoke();
        }
        // 取得请求相关的ActionContext实例
        ActionContext ctx = invocation.getInvocationContext();
        // 如果是login请求 不拦截
        if (invocation.getInvocationContext().getName().equals("login")) {
            return invocation.invoke();
        }
        Map<String, Object> session = ctx.getSession();
        Integer opId = (Integer) session.get("opId");
        String opName = (String) session.get("opName");
        if (EmptyUtil.isNotEmpty(opId) && EmptyUtil.isNotEmpty(opName)) {
            return invocation.invoke();
        }
        ctx.put("tip", "你还没有登录");
        return Action.LOGIN;
    }

}
