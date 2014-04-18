package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Operator;
import com.huoshi.im.service.OperatorService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

/**
 * 内部登陆
 * 
 * @author: Ericlee
 * @date:2014-03-12 23:54:54
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class LoginAction extends BaseAction {

    @Autowired
    private OperatorService operatorService;

    @Getter
    @Setter
    private String opName;
    @Getter
    @Setter
    private String password;

    @Getter
    private String msg;

    @Override
    public String execute() throws Exception {
        if (EmptyUtil.isEmpty(opName) || EmptyUtil.isEmpty(password)) {
            msg = "用户名和密码不能为空";
            return ERROR;
        }
        Operator operator = operatorService.verifyOperator(opName, password);
        if (EmptyUtil.isNotEmpty(operator)) {
            session.put("opId", operator.getOpId());
            session.put("opName", operator.getOpName());
            return SUCCESS;
        }
        return ERROR;
    }
}
