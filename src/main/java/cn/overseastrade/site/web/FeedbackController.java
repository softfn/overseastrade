package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.Date;

/**
 * Created by softfn on 9/1/2014.
 */
@Controller
@RequestMapping(value = "/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "send", method = RequestMethod.POST)
    public String send(@Valid Feedback email, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("email", email);
            FieldError fieldError = result.getFieldErrors().get(0);
            model.addAttribute("error",fieldError.getField() + " : " + fieldError.getDefaultMessage());
            return "/feedback/index";
        }
        email.setTime(new Date());
        feedbackService.save(email);
        return "redirect:/products";
    }
}
