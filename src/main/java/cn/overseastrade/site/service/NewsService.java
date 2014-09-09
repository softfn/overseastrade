package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.News;
import cn.overseastrade.site.repository.NewsDao;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by softfn on 9/2/2014.
 */
@Component
@Transactional
public class NewsService {
    private NewsDao newsDao;

    public void save(News news) {
        newsDao.save(news);
    }

    @Autowired
    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    public Page<News> getNews(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<News> spec = buildSpecification(searchParams);
        return newsDao.findAll(spec, pageRequest);
    }

    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("title".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "title");
        } else if ("time".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "time");
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    private Specification<News> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<News> spec = DynamicSpecifications.bySearchFilter(filters.values(), News.class);
        return spec;
    }

    public void deleteNews(Long id) {
        newsDao.delete(id);
    }

    public News getNews(Long id) {
        return newsDao.findOne(id);
    }

    public List<News> findTopNews() {
        PageRequest pageRequest = buildPageRequest(1, 10, "time");
        Specification<News> spec = buildSpecification(new HashMap<String, Object>());
        return newsDao.findAll(spec, pageRequest).getContent();
    }

}
