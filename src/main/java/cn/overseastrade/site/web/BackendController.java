package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.entity.Home;
import cn.overseastrade.site.entity.Homes;
import cn.overseastrade.site.service.ArticleService;
import cn.overseastrade.site.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by softfn on 8/29/2014.
 */
@Controller
@RequestMapping(value = "/admin")
public class BackendController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private HomeService homeService;

    @RequestMapping(value = "home")
    public String home(Model model) {
        model.addAttribute("activeId", "home");
        List<Home> homes = (List<Home>) homeService.findAll();
        if (homes.size() < 6) {
            for (int i = homes.size(); i < 6; i++) {
                homes.add(new Home());
            }
        }
        model.addAttribute("homes", homes);
        return "admin/home";
    }

    @RequestMapping(value = "home/save", method = RequestMethod.POST)
    public String home(Homes homes, Model model) {
        for (Home home : homes.getHomes()) {
            if (home.getId().equals("") || home.getBrief().equals("") || home.getPath().equals("") || home.getReferId().equals("")) {

            } else {
                home.setTime(new Date());
                homeService.save(home);
            }

        }
        model.addAttribute("activeId", "home");
        model.addAttribute("homes", homeService.findAll());
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "aboutus")
    public String aboutus(Model model) {
        Article article = articleService.getArticle(ArticleType.aboutus.name());
        model.addAttribute("aboutus", article);
        model.addAttribute("activeId", "aboutus");
        return "admin/aboutus";
    }

    @RequestMapping(value = "faq")
    public String faq(Model model) {
        Article article = articleService.getArticle(ArticleType.faq.name());
        model.addAttribute("faq", article);
        model.addAttribute("activeId", "faq");
        return "admin/faq";
    }

    @RequestMapping(value = "contactus")
    public String contactus(Model model) {
        Article article = articleService.getArticle(ArticleType.contactus.name());
        model.addAttribute("contactus", article);
        model.addAttribute("activeId", "contactus");
        return "admin/contactus";
    }

    @RequestMapping(value = "article/save", method = RequestMethod.POST)
    public String saveArticle(@Valid Article article) {
        article.setTime(new Date());
        articleService.saveArticle(article);
        if (article.getId().equals(ArticleType.aboutus.name())) {
            return "redirect:/admin/aboutus";
        } else if (article.getId().equals(ArticleType.faq.name())) {
            return "redirect:/admin/faq";
        } else if (article.getId().equals(ArticleType.contactus.name())) {
            return "redirect:/admin/contactus";
        } else {
            return "redirect:/admin/home";
        }
    }

}
