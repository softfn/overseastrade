package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Home;
import cn.overseastrade.site.repository.HomeDao;
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
public class HomeService {
    private HomeDao homeDao;

    public void save(Home home) {
        homeDao.save(home);
    }

    @Autowired
    public void setHomeDao(HomeDao homeDao) {
        this.homeDao = homeDao;
    }

    public Page<Home> getHome(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Home> spec = buildSpecification(searchParams);
        return homeDao.findAll(spec, pageRequest);
    }

    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("name".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "name");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "time");
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    private Specification<Home> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Home> spec = DynamicSpecifications.bySearchFilter(filters.values(), Home.class);
        return spec;
    }

    public Iterable<Home> findAll() {
        return homeDao.findAll(new Sort(Sort.Direction.ASC, "seq"));
    }

    public void deleteHome(Long id) {
        homeDao.delete(id);
    }

    public Home getHome(Long id) {
        return homeDao.findOne(id);
    }

}
