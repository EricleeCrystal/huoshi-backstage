package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class LaunchAction extends BaseAction {

    /** 0 全部 1 失效的 2 有效的 */
    @Setter
    private int expire;

    @Override
    public String execute() throws Exception {

        return super.execute();
    }
}
