//package com.huoshi.im.action;
//
//import lombok.Setter;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Scope;
//import org.springframework.stereotype.Service;
//import com.huoshi.im.service.BookService;
//import com.huoshi.im.service.CommentService;
//
///**
// * <pre>
// * 拉取评论
// * 供后台程序调用
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
//    private static int defaultChapterId = 1;
//    private static int defaultPageNo = 1;
//    private static int defaultPageSize = 12;
//
//    @Setter
//    private int chapterId;
//    @Setter
//    private int pageNo;
//    @Setter
//    private int cid;
//    @Setter
//    private int pageSize;
//
//    @Override
//    public void process() throws Exception {
//        write(commentService.queryPageByChapter(chapterId, cid, pageSize));
//    }
//
//    @Override
//    public void validate() {
//        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
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
