package cn.overseastrade.site.web.admin;

import cn.overseastrade.site.entity.User;
import cn.overseastrade.site.service.account.AccountService;
import cn.overseastrade.site.service.account.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

/**
 * Created by softfn on 8/24/2014.
 */
@Controller
@RequestMapping(value = "/admin/profile")
public class ProfileController {
    @Autowired
    private AccountService accountService;

    @RequestMapping(method = RequestMethod.GET)
    public String updateForm(Model model) {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        Long id = user.id;
        model.addAttribute("user", accountService.getUser(id));
        return "admin/profile";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("user") User user) {
        accountService.updateUser(user);
        ShiroDbRealm.ShiroUser su = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        su.name = user.getName();
        return "redirect:/login";
    }

    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (id != -1) {
            model.addAttribute("user", accountService.getUser(id));
        }
    }
}
