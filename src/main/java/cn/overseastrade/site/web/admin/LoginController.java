package cn.overseastrade.site.web.admin;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by softfn on 8/24/2014.
 */
@Controller
public class LoginController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        return "admin/login";
    }

    @RequestMapping(value = "/admin/platform", method = RequestMethod.GET)
    public String success() {
        return "admin/platform";
    }
}
