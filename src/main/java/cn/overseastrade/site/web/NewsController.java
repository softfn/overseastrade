package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.entity.News;
import cn.overseastrade.site.service.NewsService;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * Created by softfn on 9/1/2014.
 */
@Controller
@RequestMapping(value = "/admin")
public class NewsController {
    private static final String PAGE_SIZE = "15";
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "default");
        sortTypes.put("title", "title");
        sortTypes.put("time", "time");
    }

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "news", method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<News> newses = newsService.getNews(searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("newses", newses);
        model.addAttribute("activeId", "news");
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/news";
    }

    @RequestMapping(value = "news/save")
    public String save(@Valid News news) {
        newsService.save(news);
        return "redirect:/admin/news";
    }

    @RequestMapping(value = "news/add")
    public String add(Model model) {
        model.addAttribute("news", new News());
        return "admin/news_edit";
    }

    @RequestMapping(value = "news/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        News news = newsService.getNews(id);
        model.addAttribute("news", news);
        return "admin/news_edit";
    }

    @RequestMapping(value = "news/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        newsService.deleteNews(id);
        return "redirect:/admin/news";
    }

}
