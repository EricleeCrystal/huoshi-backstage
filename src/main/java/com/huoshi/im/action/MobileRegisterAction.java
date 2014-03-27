package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.EncryptUtil;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

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
    @Setter
    private int detail;

    @Autowired
    private UserService userService;

    @Override
    public void process() throws Exception {
        String data = "-1";
        if (reject("get")) {
            data = detail == 0 ? data : "reject get request";
            write(JsonUtil.toErrorRtnMsgJson(data));
            return;
        }
        if (EmptyUtil.isEmpty(imei)) {
            data = detail == 0 ? data : "imei is emtpy";
            write(JsonUtil.toErrorRtnMsgJson(data));
            return;
        }
        if (EmptyUtil.isEmpty(mobileNo)) {
            data = "1";
            data = detail == 0 ? data : "mobileNo is emtpy";
            write(JsonUtil.toErrorRtnMsgJson(data));
            return;
        }
        if (EmptyUtil.isEmpty(userName)) {
            data = detail == 0 ? data : "userName is emtpy";
            write(JsonUtil.toErrorRtnMsgJson(data));
            return;
        }
        userName = EmptyUtil.isEmpty(userName) ? "" : userName;
        password = EmptyUtil.isEmpty(password) ? "" : password;
        write(userService.register(detail, mobileNo, imei, userName, EncryptUtil.password(password)));
    }
}
