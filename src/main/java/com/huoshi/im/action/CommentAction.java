package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
import com.huoshi.im.vo.CommentVo;
import com.huoshi.im.vo.Page;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class CommentAction extends BaseAction {

    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;

    private static int defaultChapterId = 1;
    private static int defaultPageNo = 1;
    private static int defaultPageSize = 12;
    @Setter
    private int chapterId;
    @Setter
    private int pageNo;
    @Setter
    private int pageSize;

    @Getter
    private BookVo bookVo;
    @Getter
    private ChapterVo chapterVo;
    @Getter
    private Page<CommentVo> page;

    @Override
    public String execute() throws Exception {
        Chapter chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return ERROR;
        }
        chapterVo = new ChapterVo(chapter);
        bookVo = new BookVo(chapter.getBook());
        page = commentService.queryVoPageByChapter(chapter, pageNo, pageSize);
        return super.execute();
    }

    @Override
    public void validate() {
        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
        pageNo = pageNo < defaultPageNo ? defaultPageNo : pageNo;
        pageSize = pageNo < defaultPageSize ? defaultPageSize : pageSize;
        super.validate();
    }
}
