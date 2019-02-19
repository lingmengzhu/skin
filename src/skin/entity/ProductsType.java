package skin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tab_productstype")
public class ProductsType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)  
	private int productsTypeId;
	private String productsFunctionTitle;
	private String productsTypeName;
	public int getProductsTypeId() {
		return productsTypeId;
	}
	public void setProductsTypeId(int productsTypeId) {
		this.productsTypeId = productsTypeId;
	}
	public String getProductsFunctionTitle() {
		return productsFunctionTitle;
	}
	public void setProductsFunctionTitle(String productsFunctionTitle) {
		this.productsFunctionTitle = productsFunctionTitle;
	}
	public String getProductsTypeName() {
		return productsTypeName;
	}
	public void setProductsTypeName(String productsTypeName) {
		this.productsTypeName = productsTypeName;
	}
	@Override
	public String toString() {
		return "ProductsType [productsTypeId=" + productsTypeId + ", productsFunctionTitle=" + productsFunctionTitle
				+ ", productsTypeName=" + productsTypeName + "]";
	}
}
