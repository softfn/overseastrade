package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.entity.News;
import cn.overseastrade.site.service.ArticleService;
import cn.overseastrade.site.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by softfn on 8/29/2014.
 */
@Controller
public class MenuController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private NewsService newsService;

    @ModelAttribute
    public void findTopNews(Model model) {
        List<News> topNews = newsService.findTopNews();
        model.addAttribute("newses", topNews);
    }

    @RequestMapping(value = {"/home", "/"})
    public String home(Model model) {
        List<News> topNews = newsService.findTopNews();
        model.addAttribute("newses", topNews);
        return "index";
    }

    @RequestMapping(value = "/aboutus")
    public String ablutus(Model model) {
        Article article = articleService.getArticle(ArticleType.aboutus.name());
        model.addAttribute("aboutus", article);
        return "aboutus/index";
    }

    @RequestMapping(value = "/products")
    public String products() {
        return "products/index";
    }

    @RequestMapping(value = "/news")
    public String news(Model model) {
        return news(1, model);
    }

    @RequestMapping(value = "/news/{page}", method = RequestMethod.GET)
    public String news(@PathVariable("page") int pageNumber, Model model) {
        Page<News> newses = newsService.getNews(new HashMap(){}, pageNumber, 25, "time");
        model.addAttribute("newsPage", newses);
        return "news/index";
    }

    @RequestMapping(value = "/download")
    public String download() {
        return "download/index";
    }

    @RequestMapping(value = "/faq")
    public String faq(Model model) {
        Article article = articleService.getArticle(ArticleType.faq.name());
        model.addAttribute("faq", article);
        return "faq/index";
    }

    @RequestMapping(value = "/feedback")
    public String feedback() {
        return "feedback/index";
    }

    @RequestMapping(value = "/contactus")
    public String contactus(Model model) {
        Article article = articleService.getArticle(ArticleType.contactus.name());
        model.addAttribute("contactus", article);
        return "contactus/index";
    }

    @RequestMapping(value = "/products/more")
    public String moreProducts() {
        return "products/index";
    }

    @RequestMapping(value = "/products/search/{keywords}", method = RequestMethod.GET)
    public String searchProducts(@PathVariable("keywords") String keywords, Model model) {
        System.out.println("keywords = [" + keywords + "], model = [" + model + "]");
        return "products/search";
    }

}
