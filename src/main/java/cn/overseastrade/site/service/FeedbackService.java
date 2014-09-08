package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.repository.FeedbackDao;
import cn.overseastrade.site.service.email.MimeMailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.Map;

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
//        mimeMailService.sendNotificationMail(feedback);
    }

    @Autowired
    public void setFeedbackDao(FeedbackDao feedbackDao) {
        this.feedbackDao = feedbackDao;
    }

    @Autowired
    public void setMimeMailService(MimeMailService mimeMailService) {
        this.mimeMailService = mimeMailService;
    }

    public Page<Feedback> getFeedback(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Feedback> spec = buildSpecification(searchParams);
        return feedbackDao.findAll(spec, pageRequest);
    }

    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("title".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "title");
        } else if ("email".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "email");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "time");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "state");
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    private Specification<Feedback> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Feedback> spec = DynamicSpecifications.bySearchFilter(filters.values(), Feedback.class);
        return spec;
    }
}
