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
        String result = "-1";
        if (reject("get")) {
            result = detail == 0 ? result : JsonUtil.toErrorRtnMsgJson("reject get request");
            write(result);
            return;
        }
        if (EmptyUtil.isEmpty(imei)) {
            result = detail == 0 ? result : JsonUtil.toErrorRtnMsgJson("imei is emtpy");
            write(result);
            return;
        }
        if (EmptyUtil.isEmpty(mobileNo)) {
            result = "1";
            result = detail == 0 ? result : JsonUtil.toErrorRtnMsgJson("mobileNo is emtpy");
            write(result);
            return;
        }
        if (EmptyUtil.isEmpty(userName)) {
            result = detail == 0 ? result : JsonUtil.toErrorRtnMsgJson("userName is emtpy");
            write(result);
            return;
        }
        userName = EmptyUtil.isEmpty(userName) ? "" : userName;
        password = EmptyUtil.isEmpty(password) ? "" : password;
        write(userService.register(detail, mobileNo, imei, userName, EncryptUtil.password(password)));
    }
}
