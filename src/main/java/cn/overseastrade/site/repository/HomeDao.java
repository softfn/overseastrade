package cn.overseastrade.site.repository;

import cn.overseastrade.site.entity.Home;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by softfn on 9/1/2014.
 */
public interface HomeDao extends PagingAndSortingRepository<Home, Long>, JpaSpecificationExecutor<Home> {

}
