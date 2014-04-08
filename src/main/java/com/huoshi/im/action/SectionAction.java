package com.huoshi.im.action;

import java.util.Collections;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Book;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
import com.huoshi.im.vo.SectionVo;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class SectionAction extends BaseAction {

    @Setter
    private int bookId;
    @Setter
    private int chapterNo;
    @Getter
    private BookVo bookVo;
    @Getter
    private ChapterVo chapterVo;
    @Autowired
    private BookService bookService;

    @Getter
    private List<SectionVo> sectionVoList = Collections.emptyList();
    @Getter
    private String msg = null;

    @Override
    public String execute() throws Exception {
        Book book = bookService.queryBookById(bookId);
        if (EmptyUtil.isEmpty(book)) {
            msg = String.format("找不到编号为 %d 的圣经书目", bookId);
            return ERROR;
        }
        // 将po对象转换为vo对象
        bookVo = new BookVo(book);

        Chapter chapter = bookService.queryChapterByBookAndNo(book, chapterNo);
        if (EmptyUtil.isEmpty(chapter)) {
            msg = String.format("%s 找不到编号为 %d 的章节", bookVo.getBookName(), chapterNo);
            return ERROR;
        }
        chapterVo = new ChapterVo(chapter);

        sectionVoList = bookService.querySectionVoByChapter(chapter);

        return super.execute();
    }
}
