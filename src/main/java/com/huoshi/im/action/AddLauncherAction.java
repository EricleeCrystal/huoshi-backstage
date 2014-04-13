package com.huoshi.im.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 * 跳转至启动添加页面
 * 
 * @author: Ericlee
 * @date:2014-04-13 18:47:59
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class AddLauncherAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
