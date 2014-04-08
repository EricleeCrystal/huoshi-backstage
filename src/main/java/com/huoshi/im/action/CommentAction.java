package com.huoshi.im.action;

import java.util.List;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.UserService;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.BookVo;
import com.huoshi.im.vo.ChapterVo;
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
    private UserService userService;

    private static int defaultChapterId = 1;

    @Setter
    private int chapterId;

    @Getter
    private BookVo bookVo;
    @Getter
    private ChapterVo chapterVo;
    /** 当前操作使用的账号 */
    @Getter
    private List<UserVo> userVoList;

    @Override
    public String execute() throws Exception {
        Chapter chapter = bookService.queryChapterById(chapterId);
        if (EmptyUtil.isEmpty(chapter)) {
            return ERROR;
        }
        chapterVo = new ChapterVo(chapter);
        bookVo = new BookVo(chapter.getBook());
        userVoList = userService.queryInnerUser();
        return super.execute();
    }

    @Override
    public void validate() {
        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
        super.validate();
    }
}
