package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class CommentAction extends BaseAction {

    @Autowired
    private BookService bookService;
    private static int defaultChapterId = 1;

    @Setter
    private int chapterId;

    @Getter
    private BookVo bookVo;
    @Getter
    private ChapterVo chapterVo;

    @Override
    public String execute() throws Exception {
        Chapter chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return ERROR;
        }
        chapterVo = new ChapterVo(chapter);
        bookVo = new BookVo(chapter.getBook());
        return super.execute();
    }

    @Override
    public void validate() {
        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
        super.validate();
    }
}
