package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Comment;
import com.huoshi.im.vo.User;

/**
 * 后台使用 添加评论
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class SaveCommentAction extends BaseAction {

    @Setter
    private String userName;
    @Setter
    private int chapterId;
    @Setter
    private String content;

    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @Override
    public void process() throws Exception {
        String result = "";
        if (EmptyUtil.isEmpty(userName)) {
            result = "username should not be empty";
            write(result);
            return;
        }
        if (EmptyUtil.isEmpty(content)) {
            result = "commment content should not be empty";
            write(result);
            return;
        }

        User user = userService.register(userName);
        Comment comment = commentService.saveComment(user, chapterId, content);
        write(JsonUtil.toRtnMsgJson(comment));
    }
}
