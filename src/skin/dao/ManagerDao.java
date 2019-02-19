package skin.dao;

import java.util.List;

import skin.entity.Manager;

public interface ManagerDao {

	Manager MLogin(Manager M);

	int getManagerCount(String key);

	List<Manager> managerM(int currentPage, int pageSize, String key);

	void updateM(Manager m);

	Manager findM(String mName);

	void delM(Manager m);

}
