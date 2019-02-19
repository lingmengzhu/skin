package skin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import skin.dao.BeautyInformationDao;
import skin.entity.BeautyInformation;
import skin.entity.Tools;
import skin.service.BeautyInformationService;
import skin.util.Pager;

@Service(value = "beautyInformationService")
@Transactional
public class BeautyInformationServiceImpl implements BeautyInformationService {
	@Autowired
	private BeautyInformationDao beautyInformationDao;

	@Override
	public Pager<BeautyInformation> informationM(int currentPage, int pageSize, String key) {
		// TODO Auto-generated method stub
		int recordTotal=beautyInformationDao.getInformationCount(key);
		int pageTotal=(int) Math.ceil(recordTotal * 1.0 / pageSize);
		List<BeautyInformation> list = beautyInformationDao.informationM(currentPage, pageSize,key);
		Pager<BeautyInformation> pb = new Pager<>();
		pb.setPageTotal(pageTotal);
		pb.setCurrentPage(currentPage);
		pb.setContent(list);
		pb.setRecordTotal(recordTotal);
		return pb;
	}

	@Override
	public void addBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		beautyInformationDao.addBI(bInfo);
	}

	@Override
	public void updateBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		beautyInformationDao.updateBI(bInfo);
	}

	@Override
	public void delBI(BeautyInformation bInfo) {
		// TODO Auto-generated method stub
		beautyInformationDao.delBI(bInfo);
	}

	@Override
	public BeautyInformation findBI(int bIId) {
		// TODO Auto-generated method stub
		return beautyInformationDao.findBI(bIId);
	}

	@Override
	public List<BeautyInformation> findBeautyinformation(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return beautyInformationDao.findBeautyinformation(currentPage,pageSize);
	}

}
