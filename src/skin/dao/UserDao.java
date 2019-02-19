package skin.dao;

import java.util.List;

import skin.entity.User;

public interface UserDao {

	void addU(User u);

	int getUserCount(String key);

	List<User> userM(int currentPage, int pageSize, String key);

	void delU(User u);

	void updateU(User u);

	User findU(String uName);


}
