package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.News;
import cn.overseastrade.site.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by softfn on 8/29/2014.
 */
@Controller
public class HomeController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/")
    public String index(Model model) {
        List<News> topNews = newsService.findTopNews();
        model.addAttribute("newses", topNews);
        return "index";
    }

    @RequestMapping(value = "/home")
    public String home(Model model) {
        List<News> topNews = newsService.findTopNews();
        model.addAttribute("newses", topNews);
        return "index";
    }
}
