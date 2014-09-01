package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by softfn on 9/1/2014.
 */
@Controller
@RequestMapping(value = "/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "send", method = RequestMethod.POST)
    public String send(@Valid Feedback email) {
        feedbackService.save(email);
        return "redirect:/products";
    }
}
