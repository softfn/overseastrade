package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Category;
import cn.overseastrade.site.repository.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.List;
import java.util.Map;

/**
 * Created by softfn on 9/2/2014.
 */
@Component
@Transactional
public class CategoryService {
    private CategoryDao categoryDao;

    public void save(Category category) {
        categoryDao.save(category);
    }

    @Autowired
    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public Page<Category> getCategory(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Category> spec = buildSpecification(searchParams);
        return categoryDao.findAll(spec, pageRequest);
    }

    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "seq");
        } else if ("name".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "name");
        } else if ("id".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "time");
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    private Specification<Category> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Category> spec = DynamicSpecifications.bySearchFilter(filters.values(), Category.class);
        return spec;
    }

    public void deleteCategory(Long id) {
        List<Category> categories = categoryDao.findByCategoryId(id, new Sort(Sort.Direction.DESC, "id"));
        if (categories != null && categories.size() > 0) {
            for (Category category : categories) {
                deleteCategory(category.getId());
            }
        }
        categoryDao.delete(id);
    }

    public Category getCategory(Long id) {
        return categoryDao.findOne(id);
    }

    public Iterable<Category> getAllCategory() {
        return categoryDao.findAll();
    }

    public List<Category> findFirstCategories() {
        return categoryDao.findByCategoryId(null, new Sort(Sort.Direction.ASC, "seq"));
    }

}
