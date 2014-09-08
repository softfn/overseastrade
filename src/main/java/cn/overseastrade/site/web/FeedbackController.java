package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Feedback;
import cn.overseastrade.site.service.FeedbackService;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.Map;

/**
 * Created by softfn on 9/1/2014.
 */
@Controller
public class FeedbackController {
    private static final String PAGE_SIZE = "15";
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "default");
        sortTypes.put("title", "title");
        sortTypes.put("email", "email");
        sortTypes.put("time", "time");
        sortTypes.put("state", "state");
    }

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value = "/feedback/send", method = RequestMethod.POST)
    public String send(@Valid Feedback email, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("email", email);
            FieldError fieldError = result.getFieldErrors().get(0);
            model.addAttribute("error",fieldError.getField() + " : " + fieldError.getDefaultMessage());
            return "feedback/index";
        }
        email.setTime(new Date());
        feedbackService.save(email);
        return "feedback/success";
    }

    @RequestMapping(value = "/admin/feedback", method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Feedback> feedbacks = feedbackService.getFeedback(searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("feedbacks", feedbacks);
        model.addAttribute("activeId", "feedback");
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/feedback";
    }
}
