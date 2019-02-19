package skin.service;

import skin.entity.Manager;
import skin.util.Pager;

public interface ManagerService {

	Manager MLogin(Manager M);

	Pager<Manager> managerM(int currentPage, int pageSize, String key);

	void updateM(Manager m);

	Manager findM(String mName);

	void delM(Manager m);

}
