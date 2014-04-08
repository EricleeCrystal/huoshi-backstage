package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.User;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.IPService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ClientUtil;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.util.ValueUtil.HTMLUtil;
import com.huoshi.im.vo.Constants.ErrorCode;

/**
 * <pre>
 * 添加评论 仅供手机终端调用
 * @author: Ericlee
 * @date:2014-03-15 17:35:02
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class MSaveCommentAction extends BaseAction {

    @Setter
    private int userId;
    @Setter
    private int bookId;
    @Setter
    private int chapterNo;
    @Setter
    private String content;
    @Setter
    private int superId;

    @Autowired
    private UserService userService;
    @Autowired
    private IPService ipService;
    @Autowired
    private CommentService commentService;

    @Override
    public void process() throws Exception {
        // 只接受post请求
        if (reject("get")) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.REJECT));
            return;
        }
        // 内容为空
        if (EmptyUtil.isEmpty(content)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.EMPTY));
            return;
        }
        // 找不到用户
        User user = userService.queryByUserId(userId);
        if (EmptyUtil.isEmpty(user)) {
            write(JsonUtil.toErrorRtnMsgJson(ErrorCode.USER_NOT_FOUND));
            return;
        }
        // 将回车空格换成字符串形式
        content = HTMLUtil.fromHtml(content);

        String ip = ClientUtil.getClientAddr(request);
        String addr = ipService.queryAddrByIP(ip);
        write(commentService.saveComment(user, bookId, chapterNo, ip, addr, content, superId));
    }

    @Override
    public void validate() {
        superId = superId < 0 ? 0 : superId;
        super.validate();
    }

}
