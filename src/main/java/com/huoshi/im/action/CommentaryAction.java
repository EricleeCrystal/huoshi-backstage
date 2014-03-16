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
import com.huoshi.im.po.Commentary;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

@Service
@Scope("prototye")
@SuppressWarnings("serial")
public class CommentaryAction extends BaseAction {

    @Setter
    private int chapterId;

    @Getter
    private Chapter chapter;
    @Getter
    private Book book;
    @Getter
    private List<Commentary> commentaryList = Collections.emptyList();

    @Autowired
    private BookService bookService;

    @Override
    public String execute() throws Exception {
        chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return ERROR;
        }
        commentaryList = bookService.queryCommentaryByChapter(chapter);
        return super.execute();
    }
}
