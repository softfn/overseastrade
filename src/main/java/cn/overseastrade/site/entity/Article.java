package cn.overseastrade.site.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by softfn on 9/3/2014.
 */
@Entity
@Table(name = "ot_article")
public class Article {
    private String id;
    private String subject;
    private String keywords;
    private String content;
    private Date time;

    @Id
    @NotBlank
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @NotBlank
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    @NotBlank
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
        return "Article{" +
                "id='" + id + '\'' +
                ", subject='" + subject + '\'' +
                ", keywords='" + keywords + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                '}';
    }
}
