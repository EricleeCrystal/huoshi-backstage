package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.User;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.ErrorCode;

@SuppressWarnings("serial")
@Service
public class MVoteCommentAction extends BaseAction {

    @Setter
    private int cid;
    @Setter
    private int userId;
    @Setter
    private int vote;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    @Override
    public void process() throws Exception {
        // 只接受post请求
        if (reject("get")) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.REJECT));
            return;
        }
        // 找不到用户
        User user = userService.queryByUserId(userId);
        if (EmptyUtil.isEmpty(user)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.USERNOTFOUND));
            return;
        }
        commentService.vote(user, cid);
    }
}
