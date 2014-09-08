package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Article;
import cn.overseastrade.site.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by softfn on 8/29/2014.
 */
@Controller
public class MenuController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/home")
    public String home() {
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
    public String news() {
        return "news/index";
    }

    @RequestMapping(value = "/download")
    public String download() {
        return "download/index";
    }

    @RequestMapping(value = "/faq")
    public String faq() {
        return "faq/index";
    }

    @RequestMapping(value = "/feedback")
    public String feedback() {
        return "feedback/index";
    }

    @RequestMapping(value = "/contactus")
    public String contactus() {
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
