package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.*;
import cn.overseastrade.site.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import java.util.ArrayList;
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

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute
    public void findTopNews(Model model) {
        List<News> topNews = newsService.findTopNews();
        model.addAttribute("newses", topNews);
    }

    @ModelAttribute
    public void firstCategories(Model model) {
        List<Category> firstCategories = categoryService.findFirstCategories();
        model.addAttribute("firstCategories", firstCategories);
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

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String products(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                           @RequestParam(value = "toggle", defaultValue = "2") int toggle, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        model.addAttribute("title", "Products");
        Page<Product> productPage = productService.getProduct(searchParams, pageNumber, (toggle == 2 ? 12 : 8), "time");
        model.addAttribute("productPage", productPage);
        model.addAttribute("toggle", toggle);

        return "products/category";
    }

    @RequestMapping(value = "/products/view/{id}", method = RequestMethod.GET)
    public String products(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "products/view";
    }

    @RequestMapping(value = "/products/category/{id}", method = RequestMethod.GET)
    public String products(@PathVariable("id") Long id, @RequestParam(value = "page", defaultValue = "1") int pageNumber,
             @RequestParam(value = "toggle", defaultValue = "2") int toggle, Model model, ServletRequest request) {
        model.addAttribute("categoryId", id);

        Category category = categoryService.getCategory(id);
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("RK_code", category.getCode().substring(0,3));

        model.addAttribute("subCategory", categoryService.getCategory(param, 1, 100, "code").getContent());
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
        searchParams.put("RK_category.code", category.getCode());
        Page<Product> productPage = productService.getProduct(searchParams, pageNumber, (toggle == 2 ? 12 : 8), "time");
        model.addAttribute("productPage", productPage);

        model.addAttribute("id", id);
        model.addAttribute("toggle", toggle);
        return "products/category";
    }

    @RequestMapping(value = "/products/search/{keywords}", method = RequestMethod.GET)
    public String products(@PathVariable("keywords") String keywords, @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                           @RequestParam(value = "toggle", defaultValue = "2") int toggle, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        searchParams.put("LIKE_name", keywords);
        model.addAttribute("title", "Products");
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        Page<Product> productPage = productService.getProduct(searchParams, pageNumber, (toggle == 2 ? 12 : 8), "time");
        model.addAttribute("productPage", productPage);

        model.addAttribute("toggle", toggle);

        return "products/category";
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
}
