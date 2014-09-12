package cn.overseastrade.site.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author wenbing.zhang
 * @version DEP6.0, : 2014/9/12.
 * @see cn.overseastrade.site.entity
 */
@Entity
@Table(name = "ot_product")
public class Product extends IdEntity {
    private Category category;
    private String name;
    private String brief;
    private String description;
    private Date time;

    private List<Picture> pictures = new ArrayList<Picture>();
    private List<ReferProduct> referProducts = new ArrayList<ReferProduct>();

    @ManyToOne
    @JoinColumn(name = "category_id")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @NotBlank
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @NotBlank
    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    @Lob
    @Basic(fetch=FetchType.LAZY)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @OneToMany(mappedBy="product",cascade={CascadeType.ALL})
    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.LAZY)
    @JoinTable(name = "ot_refer_product",
            joinColumns = {
                    @JoinColumn(name = "product_id", referencedColumnName = "id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "refer_product_id", referencedColumnName = "id")
            }
    )
    public List<ReferProduct> getReferProducts() {
        return referProducts;
    }

    public void setReferProducts(List<ReferProduct> referProducts) {
        this.referProducts = referProducts;
    }

    @Override
    public String toString() {
        return "Product{" +
                "category=" + category +
                ", name='" + name + '\'' +
                ", brief='" + brief + '\'' +
                ", description='" + description + '\'' +
                ", time=" + time +
                ", pictures=" + pictures +
                ", referProducts=" + referProducts +
                '}';
    }
}
