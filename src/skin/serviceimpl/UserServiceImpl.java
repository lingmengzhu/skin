package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.UserDao;
import skin.entity.User;
import skin.service.UserService;
import skin.util.Pager;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public void addU(User u) {
		// TODO Auto-generated method stub
		userDao.addU(u);
	
	}

	@Override
	public Pager<User> userM(int currentPage, int pageSize,String key) {
		// TODO Auto-generated method stub
		int recordTotal=userDao.getUserCount(key);
		int pageTotal=(int) Math.ceil(recordTotal * 1.0 / pageSize);
		List<User> list = userDao.userM(currentPage, pageSize,key);
		Pager<User> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void delU(User u) {
		// TODO Auto-generated method stub
		userDao.delU(u);
	}

	@Override
	public void updateU(User u) {
		// TODO Auto-generated method stub
		userDao.updateU(u);
	}

	@Override
	public User findU(String uName) {
		// TODO Auto-generated method stub
		return userDao.findU(uName);
	}


}
