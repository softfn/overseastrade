package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.entity.Download;
import cn.overseastrade.site.entity.News;
import cn.overseastrade.site.service.ArticleService;
import cn.overseastrade.site.service.DownloadService;
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

    @Autowired
    private DownloadService downloadService;

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

    @RequestMapping(value = "/products/scroll/page/{pageNumber}", method = RequestMethod.GET)
    @ResponseBody
    public String products(@PathVariable("pageNumber") int pageNumber, Model model) {
        StringBuffer sb = new StringBuffer();
        sb.append("<div class=\"grid\">");
        sb.append(" <div class=\"imgholder\">");
        sb.append("     <img src=\"http://www.inwebson.com/demo/blocksit-js/demo2/images/img2.jpg\" />");
        sb.append(" </div>");
        sb.append("<strong>Battle Field</strong>");
        sb.append("<p>Battle Field for you...</p>");
        sb.append("<div class=\"meta\">by Andrea Andrade</div>");
        sb.append("</div>");
        return sb.toString();
    }

    @RequestMapping(value = "/news")
    public String news(Model model) {
        return news(1, model);
    }

    @RequestMapping(value = "/news/page/{pageNumber}", method = RequestMethod.GET)
    public String news(@PathVariable("pageNumber") int pageNumber, Model model) {
        Page<News> newses = newsService.getNews(new HashMap() {
        }, pageNumber, 25, "time");
        model.addAttribute("newsPage", newses);
        return "news/index";
    }

    @RequestMapping(value = "/news/view/{id}", method = RequestMethod.GET)
    public String getNews(@PathVariable("id") Long id, Model model) {
        News news = newsService.getNews(id);
        model.addAttribute("viewNews", news);
        return "news/view";
    }

    @RequestMapping(value = "/download")
    public String download(Model model) {
        return download(1, model);
    }

    @RequestMapping(value = "/download/page/{pageNumber}", method = RequestMethod.GET)
    public String download(@PathVariable("pageNumber") int pageNumber, Model model) {
        Page<Download> downloadPage = downloadService.getDownload(new HashMap() {
        }, pageNumber, 25, "time");
        model.addAttribute("downloadPage", downloadPage);
        return "download/index";
    }

    @RequestMapping(value = "/download/view/{id}", method = RequestMethod.GET)
    public String getDownload(@PathVariable("id") Long id, Model model) {
        Download download = downloadService.getDownload(id);
        model.addAttribute("viewDownload", download);
        return "download/view";
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
