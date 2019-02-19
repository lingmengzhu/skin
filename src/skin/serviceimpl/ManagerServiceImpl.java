package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.ManagerDao;
import skin.entity.Manager;
import skin.entity.User;
import skin.service.ManagerService;
import skin.util.Pager;

@Service(value = "managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	@Override
	public Manager MLogin(Manager M) {
		// TODO Auto-generated method stub
		return managerDao.MLogin(M);
	}

	@Override
	public Pager<Manager> managerM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		int recordTotal=managerDao.getManagerCount(key);
		int pageTotal=(int) Math.ceil(recordTotal * 1.0 / pageSize);
		List<Manager> list = managerDao.managerM(currentPage, pageSize,key);
		Pager<Manager> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void updateM(Manager m) {
		// TODO Auto-generated method stub
		managerDao.updateM(m);
	}

	@Override
	public Manager findM(String mName) {
		// TODO Auto-generated method stub
		return managerDao.findM(mName);
	}

	@Override
	public void delM(Manager m) {
		// TODO Auto-generated method stub
		managerDao.delM(m);
	}


}
