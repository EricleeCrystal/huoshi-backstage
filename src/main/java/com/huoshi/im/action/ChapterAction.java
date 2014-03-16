package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class ChapterAction extends BaseAction {

    @Setter
    private int bookId;
    @Getter
    private BookVo bookVo;
    /** 第一本书编号 */
    private static int startBookNo = 1;
    @Autowired
    private BookService bookService;

    @Override
    public String execute() throws Exception {
        bookVo = bookService.queryBookVoById(bookId);
        if (EmptyUtil.isEmpty(bookVo)) {
            bookVo = bookService.queryBookVoByNo(startBookNo);
        }
        return super.execute();
    }
}
