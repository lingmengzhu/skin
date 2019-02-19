package skin.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "tab_manager")
public class Manager {
		@Id
		private String managerName;
		private String managerPassword;
		public String getManagerName() {
			return managerName;
		}
		public void setManagerName(String managerName) {
			this.managerName = managerName;
		}
		public String getManagerPassword() {
			return managerPassword;
		}
		public void setManagerPassword(String managerPassword) {
			this.managerPassword = managerPassword;
		}
		public Manager() {
			super();
		}
		public Manager(String managerName, String managerPassword) {
			super();
			this.managerName = managerName;
			this.managerPassword = managerPassword;
		}
		@Override
		public String toString() {
			return "Manager [managerName=" + managerName + ", managerPassword=" + managerPassword + "]";
		}
		
		
		
		
		
	}