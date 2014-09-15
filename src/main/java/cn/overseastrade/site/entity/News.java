package cn.overseastrade.site.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by softfn on 9/9/2014.
 */
@Entity
@Table(name = "ot_news")
public class News extends IdEntity {
    private String title;
    private String content;
    private Date time;

    @NotBlank
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @NotBlank
    @Lob
    @Basic(fetch = FetchType.LAZY)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "News{" +
                "title='" + title + '\'' +
                '}';
    }
}
