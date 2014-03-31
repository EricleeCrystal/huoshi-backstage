package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.User;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Constants.ErrorCode;
import com.huoshi.im.vo.Constants.Vote;

/**
 * 评论点赞
 * 
 * @author: Ericlee
 * @date:2014-03-31 21:28:43
 */
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
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.USER_NOT_FOUND));
            return;
        }
        // 请求点赞
        if (vote == Vote.ENVOTE) {
            write(commentService.enVote(user, cid));
        } else {
            // 取消点赞
            write(commentService.deVote(user, cid));

        }
    }
}
