package cn.overseastrade.site.repository;

import cn.overseastrade.site.entity.Product;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by softfn on 9/1/2014.
 */
public interface ProductDao extends PagingAndSortingRepository<Product, Long>, JpaSpecificationExecutor<Product> {

}
