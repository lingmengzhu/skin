package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.ToolsDao;
import skin.entity.Products;
import skin.entity.Tools;
import skin.entity.User;
import skin.service.ToolsService;
import skin.util.Pager;

@Service(value = "toolsService")
@Transactional
public class ToolsServiceImpl implements ToolsService {
	@Autowired
	private ToolsDao toolsDao;

	@Override
	public Pager<Tools> toolsM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		int recordTotal=toolsDao.getToolsCount(key);
		int pageTotal=(int) Math.ceil(recordTotal * 1.0 / pageSize);
		List<Tools> list = toolsDao.ToolsM(currentPage, pageSize,key);
		Pager<Tools> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void updateT(Tools t) {
		// TODO Auto-generated method stub
		toolsDao.updateT(t);
	}

	@Override
	public Tools findT(int tId) {
		// TODO Auto-generated method stub
		return toolsDao.findT(tId);
	}

	@Override
	public void delT(Tools t) {
		// TODO Auto-generated method stub
		toolsDao.delT(t);
	}

	@Override
	public void addT(Tools t) {
		// TODO Auto-generated method stub
		toolsDao.addT(t);
	}

	@Override
	public Pager<Tools> findToolsPager(int currentPage, int pageSize, String toolsType, String key) {
		// TODO Auto-generated method stub
		int recordTotal = toolsDao.getToolsCount(toolsType,key);
		System.out.println("recordTotal"+recordTotal);
		int pageTotal = (int) Math.ceil(recordTotal * 1.0 / pageSize);
		System.out.println("pageTotal"+pageTotal);
		List<Tools> list = toolsDao.findToolsPager(currentPage, pageSize, toolsType,key);
		Pager<Tools> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public List<String> findToolsType() {
		// TODO Auto-generated method stub
		return toolsDao.findToolsType();
	}

}
