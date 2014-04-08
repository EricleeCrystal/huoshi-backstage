package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.User;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.CommentVo;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class UpdateCommentAction extends BaseAction {

    @Setter
    private int cid;
    @Setter
    private String userName;
    @Setter
    private String createTime;
    @Setter
    private int floorNo;
    @Setter
    private String content;
    @Setter
    private int forbid;

    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @Override
    public void process() throws Exception {
        String result = "";
        if (EmptyUtil.isEmpty(userName)) {
            result = "username should not be empty";
            write(JsonUtil.toErrorRtnMsgJson(result));
            return;
        }
        if (EmptyUtil.isEmpty(content)) {
            result = "commment content should not be empty";
            write(JsonUtil.toErrorRtnMsgJson(result));
            return;
        }
        // 首先查找用户名是否已经注册 如果已经注册 使用原有的用户如果没有注册 新注册一个
        User user = userService.registerifAbsent(userName);
        CommentVo commentVo = commentService.updateComment(user, cid, createTime, floorNo, content, forbid <= 0 ? false : true);
        write(JsonUtil.toRtnMsgJson(commentVo));
    }
}
