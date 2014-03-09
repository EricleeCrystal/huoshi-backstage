package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import com.huoshi.im.service.OperatorService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Operator;

/**
 * 内部登陆
 * 
 * @author: Ericlee
 * @date:2014-04-07 23:04:49
 */
@SuppressWarnings("serial")
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
