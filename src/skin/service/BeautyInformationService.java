package skin.service;

import java.util.List;

import skin.entity.BeautyInformation;
import skin.util.Pager;

public interface BeautyInformationService {

	Pager<BeautyInformation> informationM(int currentPage, int pageSize, String key);

	void addBI(BeautyInformation bInfo);

	void updateBI(BeautyInformation bInfo);

	void delBI(BeautyInformation bInfo);

	BeautyInformation findBI(int bIId);

	List<BeautyInformation> findBeautyinformation(int currentPage, int pageSize);


}
