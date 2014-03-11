package com.huoshi.im.action;

import java.util.Collections;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Book;
import com.huoshi.im.vo.Chapter;
import com.huoshi.im.vo.Section;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class SectionAction extends BaseAction {

    @Setter
    private int bookId;
    @Setter
    private int chapterNo;
    @Getter
    private Book book;
    @Getter
    private Chapter chapter;
    @Autowired
    private BookService bookService;

    @Getter
    private List<Section> sectionList = Collections.emptyList();
    @Getter
    private String msg = null;

    @Override
    public String execute() throws Exception {
        book = bookService.queryByBookId(bookId);
        if (EmptyUtil.isEmpty(book)) {
            msg = String.format("找不到编号为 %d 的圣经书目", bookId);
            return ERROR;
        }
        chapter = bookService.queryByChapterNo(book, chapterNo);
        if (EmptyUtil.isEmpty(chapter)) {
            msg = String.format("%s 找不到编号为 %d 的章节", book.getBookName(), chapterNo);
            return ERROR;
        }
        sectionList = bookService.querySectionByChapter(chapter);
        return super.execute();
    }
}
