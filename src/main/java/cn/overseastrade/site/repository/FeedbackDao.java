package cn.overseastrade.site.repository;

import cn.overseastrade.site.entity.Feedback;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by softfn on 9/1/2014.
 */
public interface FeedbackDao extends PagingAndSortingRepository<Feedback, Long>, JpaSpecificationExecutor<Feedback> {
}
