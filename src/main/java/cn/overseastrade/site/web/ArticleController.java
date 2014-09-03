package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.Date;

/**
 * Created by softfn on 9/3/2014.
 */
@Controller
@RequestMapping(value = "/admin")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "aboutus", method = RequestMethod.GET)
    public String getAboutus(Model model) {
        Article article = articleService.getArticle(ArticleType.aboutus.name());
        model.addAttribute("aboutus", article);
        return "/admin/aboutus";
    }

    @RequestMapping(value = "aboutus/save", method = RequestMethod.POST)
    public String saveAboutus(@Valid Article article) {
        article.setId(ArticleType.aboutus.name());
        article.setTime(new Date());
        articleService.saveArticle(article);
        return "/admin/aboutus";
    }

    enum ArticleType {
        aboutus,faq,contactus;
    }

}
