package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.bean.PageResult;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.Chapter;
import com.huoshi.im.vo.Comment;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class CommentAction extends BaseAction {

    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;

    @Setter
    private int chapterId;
    @Setter
    private int pageNo;
    @Setter
    private int pageSize;

    @Getter
    private Chapter chapter;
    @Getter
    private PageResult<Comment> pageResult;

    @Override
    public String execute() throws Exception {
        chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return ERROR;
        }
        pageResult = commentService.queryByChapter(chapter, pageNo, pageSize);
        return super.execute();
    }
}
