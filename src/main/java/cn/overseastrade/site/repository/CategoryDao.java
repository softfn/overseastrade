package cn.overseastrade.site.repository;

import cn.overseastrade.site.entity.Category;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by softfn on 9/1/2014.
 */
public interface CategoryDao extends PagingAndSortingRepository<Category, Long>, JpaSpecificationExecutor<Category> {

}
