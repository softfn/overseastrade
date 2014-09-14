package cn.overseastrade.site.repository;

import cn.overseastrade.site.entity.Category;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by softfn on 9/1/2014.
 */
public interface CategoryDao extends PagingAndSortingRepository<Category, Long>, JpaSpecificationExecutor<Category> {
    List<Category> findByCategoryId(Long id);
}
