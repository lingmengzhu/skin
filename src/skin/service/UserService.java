package skin.service;

import skin.entity.User;
import skin.util.Pager;

public interface UserService {

	void addU(User u);

	Pager<User> userM(int currentPage, int pageSize, String key);

	void delU(User u);

	void updateU(User u);

	User findU(String uName);

	

}
