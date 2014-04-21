package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 * 保存编辑用户信息
 * 
 * @author Ericlee
 * @date 2014-4-21 上午10:52:40
 */
@SuppressWarnings("serial")
@Service
@Scope("protype")
public class ModifyUserAction extends BaseAction {

    @Setter
    private int userId;
    @Setter
    @Getter
    private int pageNo;
    @Setter
    @Getter
    private int pageSize;

    @Override
    public String execute() throws Exception {
        return super.execute();
    }
}
