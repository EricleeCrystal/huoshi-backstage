package com.huoshi.im.action;

import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
import com.huoshi.im.vo.CommentVo;
import com.huoshi.im.vo.Page;
import com.huoshi.im.vo.UserVo;

/**
 * 仅供后端服务器调用
 * 
 * @author: Ericlee
 * @date:2014-04-01 22:23:53
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class CommentAction extends BaseAction {

    @Autowired
    private BookService bookService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    private static int defaultChapterId = 1;
    /** 默认的页码和页大小 */
    private static final int defaultPageNo = 1;
    private static final int defaultPageSize = 12;

    @Setter
    @Getter
    private int chapterId;

    /** 0 倒叙 1顺序 2 点赞 */
    @Getter
    @Setter
    private int sort;
    @Getter
    @Setter
    private int pageNo;
    @Getter
    @Setter
    private int pageSize;

    @Getter
    private BookVo bookVo;
    @Getter
    private ChapterVo chapterVo;
    /** 当前操作使用的账号 */
    @Getter
    private List<UserVo> userVoList;

    @Getter
    private Page<CommentVo> page;

    @Override
    public String execute() throws Exception {
        Chapter chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return INPUT;
        }
        chapterVo = new ChapterVo(chapter);
        bookVo = new BookVo(chapter.getBook());
        userVoList = userService.queryInnerUser();
        page = commentService.queryPageByChapter(chapter, sort, pageNo, pageSize);
        return super.execute();
    }

    @Override
    public void validate() {
        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
        if (sort < 0 || sort > 2) {
            sort = 0;
        }
        pageSize = pageSize <= 0 ? defaultPageSize : pageSize;
        pageNo = pageNo <= 0 ? defaultPageNo : pageNo;
        super.validate();
    }
}
