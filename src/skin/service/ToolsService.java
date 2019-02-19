package skin.service;

import java.util.List;

import skin.entity.Tools;
import skin.util.Pager;

public interface ToolsService {

	Pager<Tools> toolsM(int currentPage, int pageSize, String key);

	void updateT(Tools t);

	Tools findT(int tId);

	void delT(Tools t);

	void addT(Tools t);

	Pager<Tools> findToolsPager(int currentPage, int pageSize, String toolsType, String key);

	List<String> findToolsType();

}
