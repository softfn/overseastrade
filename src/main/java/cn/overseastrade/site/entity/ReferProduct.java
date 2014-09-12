package cn.overseastrade.site.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author wenbing.zhang
 * @version DEP6.0, : 2014/9/12.
 * @see cn.overseastrade.site.entity
 */
@Entity
@Table(name = "ot_refer_product")
public class ReferProduct extends IdEntity {
    private String productId;
    private String referProductId;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getReferProductId() {
        return referProductId;
    }

    public void setReferProductId(String referProductId) {
        this.referProductId = referProductId;
    }

    @Override
    public String toString() {
        return "ReferProduct{" +
                "productId='" + productId + '\'' +
                ", referProductId='" + referProductId + '\'' +
                '}';
    }
}
