package cn.overseastrade.site.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author wenbing.zhang
 * @version DEP6.0, : 2014/9/12.
 * @see cn.overseastrade.site.entity
 */
@Entity
@Table(name = "ot_category")
public class Category extends IdEntity {
    private String name;
    private String code;
    private Category category;
    private Integer seq;
    private Boolean isNew;
    private Date time;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne
    @JoinColumn(name = "parent_id")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Boolean getIsNew() {
        return isNew;
    }

    public void setIsNew(Boolean isNew) {
        this.isNew = isNew;
    }

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", category=" + category.getId() +
                ", seq=" + seq +
                ", isNew=" + isNew +
                ", time=" + time +
                '}';
    }
}
