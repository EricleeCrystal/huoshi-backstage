package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

/**
 * 修改评论
 * 
 * @author: Ericlee
 * @date:2014-05-04 23:24:24
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class ModifyCommentAction extends BaseAction {

    @Setter
    @Getter
    private int cid;
    @Setter
    @Getter
    private int userId;
    @Setter
    @Getter
    private String content;
    @Setter
    @Getter
    private int forbid;

    /** 0 外部账号 1 内部账号 外部账号只允许审核 不能进行其他操作 */
    @Getter
    @Setter
    private int userType;
    @Getter
    @Setter
    private int chapterId;
    @Getter
    @Setter
    private int sort;
    @Getter
    @Setter
    private int pageSize;
    @Getter
    @Setter
    private int pageNo;
    @Getter
    @Setter
    private String msg;

    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @Override
    public String execute() throws Exception {
        if (userType == 0) {
            commentService.modifyComment(cid, forbid > 0 ? true : false);
        } else {
            if (EmptyUtil.isEmpty(content)) {
                msg = "内容不能为空";
                return INPUT;
            }
            commentService.modifyComment(cid, userId, forbid > 0 ? true : false, content);
        }
        return super.execute();
    }
}
