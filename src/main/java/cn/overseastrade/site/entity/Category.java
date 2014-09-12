package cn.overseastrade.site.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author wenbing.zhang
 * @version DEP6.0, : 2014/9/12.
 * @see cn.overseastrade.site.entity
 */
@Entity
@Table(name = "ot_category")
public class Category extends IdEntity {
    private String name;
    private Category category;

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
}
