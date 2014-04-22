package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;

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

    @Autowired
    private UserService userService;

    @Setter
    private int seqId;
    @Setter
    private String userName;
    @Setter
    private String loginip;

    @Setter
    @Getter
    private int sort;
    @Setter
    @Getter
    private int pageNo;
    @Setter
    @Getter
    private int pageSize;

    @Override
    public String execute() throws Exception {
        userService.modifyUser(seqId, userName, loginip);
        return super.execute();
    }
}
