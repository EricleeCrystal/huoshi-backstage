package com.huoshi.im.action;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 使用ioc方式获取请求的request,response和session
 * 
 * @author: Ericlee
 * @date:2014-03-12 23:54:54
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware {

    protected HttpServletResponse response;
    protected HttpServletRequest request;
    protected Map<String, Object> session;

    protected String GET = "GET";
    protected String POST = "POST";

    /**
     * 是否拒绝特定方法访问
     * 
     * @param method
     * @return
     */
    public boolean reject(String method) {
        if (!EnvUtil.isDev() && request.getMethod().equalsIgnoreCase(method)) {
            return true;
        } else {
            // 如果是开发模式 不拒绝任何访问
            return false;
        }
    }

    public boolean isGet() {
        return request.getMethod().equalsIgnoreCase(GET);
    }

    public boolean isPost() {
        return request.getMethod().equalsIgnoreCase(POST);
    }

    /**
     * 正常的业务处理 回写json数据
     * 
     * @throws Exception
     */
    public void process() throws Exception {
    }

    /**
     * 将结果字符串返回给请求发起者
     * 
     * @param rtn
     * @throws IOException
     */
    public void write(String rtn) throws IOException {
        this.response.setContentType("text/html;charset=utf-8");
        this.response.getWriter().write(rtn);
    }

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    /**
     * 因为是从nginx跳转过来的 所以获取远程IP不能直接用getRemoteAddr
     */
    public String getRemoteAddr() {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (EmptyUtil.isEmpty(remoteAddr)) {
            remoteAddr = request.getRemoteAddr();
        }
        return remoteAddr;
    }

    /**
     * 获取当前登录后台的操作id
     * 
     * @return
     */
    public int getOpId() {
        Integer opId = (Integer) session.get("opId");
        if (EmptyUtil.isEmpty(opId)) {
            return 0;
        }
        return opId.intValue();
    }
}
