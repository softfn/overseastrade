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
    private Product product;
}
