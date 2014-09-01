package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.repository.FeedbackDao;
import cn.overseastrade.site.service.email.MimeMailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by softfn on 9/2/2014.
 */
@Component
@Transactional
public class FeedbackService {
    private static Logger logger = LoggerFactory.getLogger(FeedbackService.class);

    private FeedbackDao feedbackDao;
    private MimeMailService mimeMailService;

    public void save(Feedback feedback) {
        feedbackDao.save(feedback);
        mimeMailService.sendNotificationMail(feedback);
    }

    @Autowired
    public void setFeedbackDao(FeedbackDao feedbackDao) {
        this.feedbackDao = feedbackDao;
    }

    @Autowired
    public void setMimeMailService(MimeMailService mimeMailService) {
        this.mimeMailService = mimeMailService;
    }
}
