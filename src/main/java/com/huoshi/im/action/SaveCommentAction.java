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
import com.huoshi.im.util.ValueUtil.HTMLUtil;
import com.huoshi.im.vo.CommentVo;

/**
 * <pre>
 * 添加评论 仅供后台调用
 * @author: Ericlee
 * @date:2014-03-15 17:35:02
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
        // 将回车空格换成字符串形式
        content = HTMLUtil.fromHtml(content);
        CommentVo commentVo = commentService.saveComment(user, chapterId, content);
        write(JsonUtil.toRtnMsgJson(commentVo));
    }
}
