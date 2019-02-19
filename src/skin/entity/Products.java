package skin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "tab_products")
public class Products {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY) 
		private int productsId;
		private String productsImg1;
		private String productsImg2;
		private String productsImg3;
		private String productsImg4;
		private String productsImg5;
		private String productsName;
		private String productsFunctionContent;
		private int productsTypeId;
		public int getProductsId() {
			return productsId;
		}
		public void setProductsId(int productsId) {
			this.productsId = productsId;
		}
		public String getProductsImg1() {
			return productsImg1;
		}
		public void setProductsImg1(String productsImg1) {
			this.productsImg1 = productsImg1;
		}
		public String getProductsImg2() {
			return productsImg2;
		}
		public void setProductsImg2(String productsImg2) {
			this.productsImg2 = productsImg2;
		}
		public String getProductsImg3() {
			return productsImg3;
		}
		public void setProductsImg3(String productsImg3) {
			this.productsImg3 = productsImg3;
		}
		public String getProductsImg4() {
			return productsImg4;
		}
		public void setProductsImg4(String productsImg4) {
			this.productsImg4 = productsImg4;
		}
		public String getProductsImg5() {
			return productsImg5;
		}
		public void setProductsImg5(String productsImg5) {
			this.productsImg5 = productsImg5;
		}
		public String getProductsName() {
			return productsName;
		}
		public void setProductsName(String productsName) {
			this.productsName = productsName;
		}
		public String getProductsFunctionContent() {
			return productsFunctionContent;
		}
		public void setProductsFunctionContent(String productsFunctionContent) {
			this.productsFunctionContent = productsFunctionContent;
		}
		
		public int getProductsTypeId() {
			return productsTypeId;
		}
		public void setProductsTypeId(int productsTypeId) {
			this.productsTypeId = productsTypeId;
		}
		@Override
		public String toString() {
			return "Products [productsId=" + productsId + ", productsImg1=" + productsImg1 + ", productsImg2="
					+ productsImg2 + ", productsImg3=" + productsImg3 + ", productsImg4=" + productsImg4
					+ ", productsImg5=" + productsImg5 + ", productsName=" + productsName + ", productsFunctionContent="
					+ productsFunctionContent + ", productsTypeId=" + productsTypeId + "]";
		}
}
		



