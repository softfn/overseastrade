package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Category;
import cn.overseastrade.site.service.CategoryService;
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
import java.util.Date;
import java.util.Map;

/**
 * Created by softfn on 9/1/2014.
 */
@Controller
public class CategoryController {
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "seq");
        sortTypes.put("id", "id");
        sortTypes.put("name", "name");
        sortTypes.put("time", "time");
    }

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/admin/category", method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = "15") int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Category> categoryPage = categoryService.getCategory(searchParams, pageNumber, pageSize, sortType);
        model.addAttribute("categoryPage", categoryPage);
        model.addAttribute("activeId", "category");
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/category";
    }

    @RequestMapping(value = "/admin/category/save", method = RequestMethod.POST)
    public String save(@Valid Category category) {
        if (category.getCategory().getId() == null) {
            category.setCategory(null);
        }
        category.setTime(new Date());
        categoryService.save(category);
        return "redirect:/admin/category";
    }

    @RequestMapping(value = "/admin/category/add")
    public String add(Model model) {
        model.addAttribute("categories", categoryService.getAllCategory());
        model.addAttribute("category", new Category());
        return "admin/category_edit";
    }

    @RequestMapping(value = "/admin/category/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Category category = categoryService.getCategory(id);
        model.addAttribute("category", category);
        model.addAttribute("categories", categoryService.getAllCategory());
        return "admin/category_edit";
    }

    @RequestMapping(value = "/admin/category/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        categoryService.deleteCategory(id);
        return "redirect:/admin/category";
    }

}
