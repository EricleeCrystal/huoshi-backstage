package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class ApplyEggAction extends BaseAction {

    @Setter
    private String imei;
    @Setter
    private int detail;

    @Autowired
    private UserService userService;

    @Override
    public void process() throws Exception {
        if (EmptyUtil.isEmpty(imei)) {
            String result = detail == 0 ? JsonUtil.toErrorRtnMsgJson("1") : JsonUtil.toErrorRtnMsgJson("imei is emtpy");
            write(result);
            return;
        }
        write(userService.applyEgg(imei));
    }
}
