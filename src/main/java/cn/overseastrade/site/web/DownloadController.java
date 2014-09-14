package cn.overseastrade.site.web;

import cn.overseastrade.site.entity.Download;
import cn.overseastrade.site.service.DownloadService;
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
public class DownloadController {
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "default");
        sortTypes.put("title", "title");
        sortTypes.put("time", "time");
    }

    @Autowired
    private DownloadService downloadService;

    @RequestMapping(value = "/admin/download", method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = "15") int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Download> downloadPage = downloadService.getDownload(searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("downloadPage", downloadPage);
        model.addAttribute("activeId", "download");
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/download";
    }

    @RequestMapping(value = "/admin/download/save", method = RequestMethod.POST)
    public String save(@Valid Download download) {
        download.setTime(new Date());
        downloadService.save(download);
        return "redirect:/admin/download";
    }

    @RequestMapping(value = "/admin/download/add")
    public String add(Model model) {
        model.addAttribute("activeId", "download");
        model.addAttribute("download", new Download());
        return "admin/download_edit";
    }

    @RequestMapping(value = "/admin/download/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("activeId", "download");
        Download download = downloadService.getDownload(id);
        model.addAttribute("download", download);
        return "admin/download_edit";
    }

    @RequestMapping(value = "/admin/download/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        downloadService.deleteDownload(id);
        return "redirect:/admin/download";
    }

}
