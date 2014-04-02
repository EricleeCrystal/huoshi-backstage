package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.EncryptUtil;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Constants.ErrorCode;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class MobileRegisterAction extends BaseAction {

    @Setter
    private String mobileNo;
    @Setter
    private String userName;
    @Setter
    private String password;
    @Setter
    private String imei;

    @Autowired
    private UserService userService;

    @Override
    public void process() throws Exception {
        if (reject("get")) {//
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.REJECT));
            return;
        }
        if (EmptyUtil.isEmpty(imei)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY_IMEI));
            return;
        }
        if (EmptyUtil.isEmpty(mobileNo)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY_MOBILENO));
            return;
        }
        if (EmptyUtil.isEmpty(userName)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY_USERNAME));
            return;
        }
        userName = EmptyUtil.isEmpty(userName) ? "" : userName;
        password = EmptyUtil.isEmpty(password) ? "" : password;
        write(userService.register(0, mobileNo, imei, userName, EncryptUtil.password(password), request.getRemoteAddr()));
    }
}
