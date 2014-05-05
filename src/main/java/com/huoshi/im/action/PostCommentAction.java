package com.huoshi.im.action;

import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
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
public class PostCommentAction extends BaseAction {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;

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
    private String content;
    @Getter
    @Setter
    private String msg;
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
        chapterVo = bookService.queryChapterVoById(chapterId);
        if (EmptyUtil.isEmpty(chapterVo)) {
            return INPUT;
        }
        bookVo = bookService.queryBookVoById(chapterVo.getBookId());
        userVoList = userService.queryInnerUser();
        return SUCCESS;
    }
}
