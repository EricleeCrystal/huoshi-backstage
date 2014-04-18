package com.huoshi.im.action;

import java.util.List;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.vo.BookVo;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class BookAction extends BaseAction {

    @Getter
    private List<BookVo> bookVoList;
    @Autowired
    private BookService bookService;

    @Override
    public String execute() throws Exception {
        bookVoList = bookService.queryAllBookVos();
        return super.execute();
    }
}
