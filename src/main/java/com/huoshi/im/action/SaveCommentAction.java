package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.po.User;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.IPService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.util.ValueUtil.HTMLUtil;

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
    @Getter
    private int sort;
    @Setter
    @Getter
    private int pageNo;
    @Setter
    @Getter
    private int pageSize;

    @Setter
    @Getter
    private int userId;
    @Setter
    @Getter
    private int chapterId;
    @Setter
    @Getter
    private String content;
    @Getter
    private String msg;

    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;
    @Autowired
    private IPService ipService;

    @Override
    public String execute() throws Exception {
        User user = userService.queryByUserId(userId);
        if (EmptyUtil.isEmpty(user)) {
            msg = "找不到指定用户";
            return INPUT;
        }
        Chapter chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            msg = "找不到指定章节";
            return INPUT;
        }
        if (EmptyUtil.isEmpty(content)) {
            msg = "评论内容不能为空";
            return INPUT;
        }
        content = HTMLUtil.fromHtml(content);
        String ip = user.getLoginAddr();
        String addr = ipService.queryAddrByIP(ip);
        commentService.saveComment(user, chapter, ip, addr, content, 0);
        return SUCCESS;
    }
}
