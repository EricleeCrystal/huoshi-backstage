package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Book;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class BookAction extends BaseAction {

    @Setter
    private int bookId;
    @Getter
    private Book book;
    /** 第一本书编号 */
    private static int startBookNo = 1;
    @Autowired
    private BookService bookService;

    @Getter
    private int count = 0;

    @Override
    public String execute() throws Exception {
        book = bookService.queryByBookId(bookId);
        if (EmptyUtil.isEmpty(book)) {
            book = bookService.queryByBookNo(startBookNo);
        }
        count = book.getChapterCount();
        return super.execute();
    }
}
