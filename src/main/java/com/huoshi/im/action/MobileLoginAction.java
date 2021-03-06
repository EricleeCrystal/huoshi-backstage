package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Constants.ErrorCode;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class MobileLoginAction extends BaseAction {

    @Setter
    private String mobileNo;
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
        if (EmptyUtil.isEmpty(mobileNo)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY_MOBILENO));
            return;
        }
        if (EmptyUtil.isEmpty(password)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY_PASSWORD));
            return;
        }
        String remoteAddr = request.getHeader("X-Real-IP");
        if (EmptyUtil.isEmpty(remoteAddr)) {
            remoteAddr = request.getRemoteAddr();
        }
        write(userService.mobileLogin(mobileNo, password, imei, remoteAddr));
    }
}
