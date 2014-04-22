package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.UserVo;

/**
 * 编辑用户信息
 * 
 * @author Ericlee
 * @date 2014-4-21 上午10:52:40
 */
@SuppressWarnings("serial")
@Service
@Scope("protype")
public class EditUserAction extends BaseAction {

    @Autowired
    private UserService userService;
    @Getter
    private UserVo userVo;

    @Setter
    @Getter
    private int sort;
    @Setter
    @Getter
    private int userId;
    @Setter
    @Getter
    private int pageNo;
    @Setter
    @Getter
    private int pageSize;

    @Override
    public String execute() throws Exception {
        userVo = userService.queryUserByUserId(userId);
        if (EmptyUtil.isEmpty(userVo) || EmptyUtil.isNotEmpty(userVo.getImei())) {
            return ERROR;
        }
        return super.execute();
    }
}
