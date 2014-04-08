package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.OperatorService;
import com.huoshi.im.util.LogUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

/**
 * 内部操作人员注册
 * 
 * @author: Ericlee
 * @date:2014-03-12 23:54:54
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class RegisterAction extends BaseAction {

    private Logger logger = LogUtil.getLogger();
    @Autowired
    private OperatorService operatorService;

    @Getter
    private String msg;

    @Setter
    private String opName;
    @Setter
    private String password;

    @Override
    public String execute() throws Exception {
        if (EmptyUtil.isEmpty(opName) || EmptyUtil.isEmpty(password)) {
            return ERROR;
        }
        if (operatorService.verifyExistOpName(opName)) {
            msg = "用户名已经被注册";
            session.put("msg", msg);
            return ERROR;
        } else {
            msg = "添加成功";
            operatorService.registerOperator(opName, password);
            logger.debug("register operator opName:{} password{}", opName, password);
            session.put("msg", msg);
            return super.execute();
        }
    }
}
