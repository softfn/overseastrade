package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Picture;
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
import java.util.*;

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
        sortTypes.put("hot", "hot");
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
        List<Picture> pictures = product.getPictures();
        for (Picture picture : pictures) {
            picture.setProduct(product);
        }
        List<Product> referProducts = product.getReferProducts();
        List<Product> flushReferProducts = new ArrayList<Product>();
        for (Iterator<Product> iterator = referProducts.iterator(); iterator.hasNext(); ) {
            Product pt = iterator.next();
            if (pt != null && pt.getId() != null) {
                Product product1 = productService.getProduct(pt.getId());
                if (product1 != null) {
                    flushReferProducts.add(product1);
                }
            }
        }
        product.setReferProducts(flushReferProducts);
        productService.save(product);
        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/admin/product/add")
    public String add(Model model) {
        model.addAttribute("activeId", "products");
        Product product = new Product();
        List<Picture> pictures = product.getPictures();
        Picture picture = new Picture();
        picture.setSeq(1);
        pictures.add(picture);
        picture = new Picture();
        picture.setSeq(2);
        pictures.add(picture);
        picture = new Picture();
        picture.setSeq(3);
        pictures.add(picture);
        picture = new Picture();
        picture.setSeq(4);
        pictures.add(picture);
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryService.getAllCategory());
        return "admin/product_edit";
    }

    @RequestMapping(value = "/admin/product/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProduct(id);
        model.addAttribute("activeId", "products");
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryService.getAllCategory());
        return "admin/product_edit";
    }

    @RequestMapping(value = "/admin/product/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

}
