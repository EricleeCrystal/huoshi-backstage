//package com.huoshi.im.action;
//
//import lombok.Setter;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Scope;
//import org.springframework.stereotype.Service;
//import com.huoshi.im.service.BookService;
//import com.huoshi.im.service.CommentService;
//import com.huoshi.im.util.JsonUtil;
//import com.huoshi.im.util.ValueUtil.EmptyUtil;
//import com.huoshi.im.vo.CommentVo;
//import com.huoshi.im.vo.Page;
//
///**
// * 拉取评论
// * 
// * @author: Ericlee
// * @date:2014-03-27 22:59:01
// */
//@SuppressWarnings("serial")
//@Service
//@Scope("prototype")
//public class PullCommentAction extends BaseAction {
//
//    @Autowired
//    private CommentService commentService;
//    @Autowired
//    private BookService bookService;
//
//    private static int defaultBookId = 1;
//    private static int defaultChapterNo = 1;
//
//    private static int defaultPageNo = 1;
//    private static int defaultPageSize = 12;
//
//    @Setter
//    private int bookId;
//    @Setter
//    private int chapterNo;
//    @Setter
//    private int pageNo;
//    @Setter
//    private int cid;
//    @Setter
//    private int pageSize;
//
//    @Override
//    public void process() throws Exception {
//        Page<CommentVo> page = commentService.queryVoPageByChapter(bookId, chapterNo, pageNo, pageSize, cid);
//        if (EmptyUtil.isEmpty(page)) {
//            write(JsonUtil.toErrorRtnMsgJson("could not found comment"));
//            return;
//        }
//        write(JsonUtil.toRtnMsgJson(page));
//    }
//
//    @Override
//    public void validate() {
//        bookId = bookId < defaultBookId ? defaultBookId : bookId;
//        chapterNo = chapterNo < defaultChapterNo ? defaultChapterNo : chapterNo;
//
//        pageNo = pageNo < defaultPageNo ? defaultPageNo : pageNo;
//        pageSize = pageSize < defaultPageSize ? defaultPageSize : pageSize;
//        if (cid > 0) {
//            pageNo = 0;
//        }
//        cid = cid < 0 ? 0 : cid;
//        super.validate();
//    }
// }
