package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Product;
import cn.overseastrade.site.service.CategoryService;
import cn.overseastrade.site.service.ProductService;
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
public class ProductController {
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "default");
        sortTypes.put("category", "category");
        sortTypes.put("name", "name");
        sortTypes.put("time", "time");
    }

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/admin/product", method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = "15") int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Product> productPage = productService.getProduct(searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("categories", categoryService.getAllCategory());
        model.addAttribute("productPage", productPage);
        model.addAttribute("activeId", "products");
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/product";
    }

    @RequestMapping(value = "/admin/product/save", method = RequestMethod.POST)
    public String save(@Valid Product product) {
        product.setTime(new Date());
        productService.save(product);
        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/admin/product/add")
    public String add(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product_edit";
    }

    @RequestMapping(value = "/admin/product/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "admin/product_edit";
    }

    @RequestMapping(value = "/admin/product/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

}
