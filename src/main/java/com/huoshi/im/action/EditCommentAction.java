package com.huoshi.im.action;

import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.User;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
import com.huoshi.im.vo.CommentVo;
import com.huoshi.im.vo.UserVo;

/**
 * <pre>
 * 跳转到发布评论页面
 * 
 * @author: Ericlee
 * @date:2014-03-27 22:59:01
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class EditCommentAction extends BaseAction {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Getter
    @Setter
    private int cid;
    @Getter
    @Setter
    private int sort;
    @Getter
    @Setter
    private int pageSize;
    @Getter
    @Setter
    private int pageNo;
    /** 0 外部账号 1 内部账号 外部账号只允许审核 不能进行其他操作 */
    @Getter
    @Setter
    private int userType;
    @Getter
    @Setter
    private int userId;
    @Getter
    @Setter
    private String userName;
    @Getter
    @Setter
    private String content;
    @Getter
    @Setter
    private CommentVo commentVo;
    @Getter
    @Setter
    private ChapterVo chapterVo;
    @Getter
    @Setter
    private BookVo bookVo;
    /** 当前操作使用的账号 */
    @Getter
    private List<UserVo> userVoList;

    @Override
    public String execute() throws Exception {
        commentVo = commentService.queryCommentVoById(cid);
        if (EmptyUtil.isEmpty(commentVo)) {
            return INPUT;
        }
        chapterVo = bookService.queryChapterVoById(commentVo.getChapterId());
        if (EmptyUtil.isEmpty(chapterVo)) {
            return INPUT;
        }
        bookVo = bookService.queryBookVoById(chapterVo.getBookId());
        userVoList = userService.queryInnerUser();
        userId = commentVo.getUserId();
        for (UserVo uv : userVoList) {
            if (uv.getUserId() == userId) {
                userType = 1;
                userName = uv.getUserName();
                break;
            }
        }
        if (userType == 0) {
            User u = userService.queryByUserId(userId);
            userName = u.getUserName();
        }
        return SUCCESS;
    }
}
