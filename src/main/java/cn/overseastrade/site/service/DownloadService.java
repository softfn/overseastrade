package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Download;
import cn.overseastrade.site.repository.DownloadDao;
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
public class DownloadService {
    private DownloadDao downloadDao;

    public void save(Download download) {
        downloadDao.save(download);
    }

    @Autowired
    public void setDownloadDao(DownloadDao downloadDao) {
        this.downloadDao = downloadDao;
    }

    public Page<Download> getDownload(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Download> spec = buildSpecification(searchParams);
        return downloadDao.findAll(spec, pageRequest);
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

    private Specification<Download> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Download> spec = DynamicSpecifications.bySearchFilter(filters.values(), Download.class);
        return spec;
    }

    public void deleteDownload(Long id) {
        downloadDao.delete(id);
    }

    public Download getDownload(Long id) {
        return downloadDao.findOne(id);
    }

    public List<Download> findTopDownload() {
        PageRequest pageRequest = buildPageRequest(1, 10, "time");
        Specification<Download> spec = buildSpecification(new HashMap<String, Object>());
        return downloadDao.findAll(spec, pageRequest).getContent();
    }

}
