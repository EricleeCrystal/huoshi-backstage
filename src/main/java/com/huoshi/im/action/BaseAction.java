package com.huoshi.im.action;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 使用ioc方式获取请求的request,response和session
 * 
 * @author: Ericlee
 * @date:2014-16-01 23:16:08
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware {

    protected HttpServletResponse response;
    protected HttpServletRequest request;
    protected Map<String, Object> session;

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
}
