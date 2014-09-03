package cn.overseastrade.site.service;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.repository.ArticleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by softfn on 9/3/2014.
 */
@Component
@Transactional
public class ArticleService {
    private ArticleDao articleDao;

    public Article getArticle(String id) {
        return articleDao.findOne(id);
    }

    public void saveArticle(Article article) {
        articleDao.save(article);
    }

    @Autowired
    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }
}
