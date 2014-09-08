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
 * Created by softfn on 8/29/2014.
 */
@Controller
@RequestMapping(value = "/admin")
public class BackendController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "home")
    public String home(Model model) {
        model.addAttribute("activeId", "home");
        return "admin/home";
    }

    @RequestMapping(value = "aboutus")
    public String aboutus(Model model) {
        Article article = articleService.getArticle(ArticleType.aboutus.name());
        model.addAttribute("aboutus", article);
        model.addAttribute("activeId", "aboutus");
        return "admin/aboutus";
    }

    @RequestMapping(value = "products")
    public String products(Model model) {
        model.addAttribute("activeId", "products");
        return "admin/products";
    }

    @RequestMapping(value = "news")
    public String news(Model model) {
        model.addAttribute("activeId", "news");
        return "admin/news";
    }

    @RequestMapping(value = "download")
    public String download(Model model) {
        model.addAttribute("activeId", "download");
        return "admin/download";
    }

    @RequestMapping(value = "faq")
    public String faq(Model model) {
        model.addAttribute("activeId", "faq");
        return "admin/faq";
    }

    @RequestMapping(value = "feedback")
    public String feedback(Model model) {
        model.addAttribute("activeId", "feedback");
        return "admin/feedback";
    }

    @RequestMapping(value = "contactus")
    public String contactus(Model model) {
        model.addAttribute("activeId", "contactus");
        return "admin/contactus";
    }

    @RequestMapping(value = "article/save", method = RequestMethod.POST)
    public String saveArticle(@Valid Article article) {
        article.setTime(new Date());
        articleService.saveArticle(article);
        return "redirect:/admin/aboutus";
    }

}
