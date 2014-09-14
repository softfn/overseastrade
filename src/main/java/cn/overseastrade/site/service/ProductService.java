package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Product;
import cn.overseastrade.site.repository.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by softfn on 9/2/2014.
 */
@Component
@Transactional
public class ProductService {
    private ProductDao productDao;

    public void save(Product product) {
        productDao.save(product);
    }

    @Autowired
    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public Page<Product> getProduct(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Product> spec = buildSpecification(searchParams);
        return productDao.findAll(spec, pageRequest);
    }

    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("category".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "category");
        } else if ("name".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "name");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "time");
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    private Specification<Product> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Product> spec = DynamicSpecifications.bySearchFilter(filters.values(), Product.class);
        return spec;
    }

    public void deleteProduct(Long id) {
        productDao.delete(id);
    }

    public Product getProduct(Long id) {
        return productDao.findOne(id);
    }

    public List<Product> findHotProducts() {
        PageRequest pageRequest = buildPageRequest(1, 8, "time");
        Specification<Product> spec = buildSpecification(new HashMap<String, Object>());
        return productDao.findAll(spec, pageRequest).getContent();
    }

    public List<Product> findProductByCategory(Long categoryId) {
        return productDao.findByCategoryId(categoryId);
    }
}
