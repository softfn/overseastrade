package cn.overseastrade.site.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by softfn on 8/29/2014.
 */
@Controller
@RequestMapping(value = "/admin")
public class MenuController {
    @RequestMapping(value = "home")
    public String home() {
        return "/admin/home";
    }

    @RequestMapping(value = "ablutus")
    public String ablutus() {
        return "/admin/ablutus";
    }

    @RequestMapping(value = "products")
    public String products() {
        return "/admin/products";
    }

    @RequestMapping(value = "news")
    public String news() {
        return "/admin/ablutus";
    }

    @RequestMapping(value = "download")
    public String download() {
        return "/admin/download";
    }

    @RequestMapping(value = "faq")
    public String faq() {
        return "/admin/faq";
    }

    @RequestMapping(value = "feedback")
    public String feedback() {
        return "/admin/feedback";
    }

    @RequestMapping(value = "contactus")
    public String contactus() {
        return "/admin/contactus";
    }

}
