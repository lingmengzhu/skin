package skin.dao;

import java.util.List;

import skin.entity.Products;
import skin.entity.Tools;

public interface ToolsDao {

	int getToolsCount(String key);

	List<Tools> ToolsM(int currentPage, int pageSize, String key);

	void updateT(Tools t);

	Tools findT(int tId);

	void delT(Tools t);

	void addT(Tools t);

	int getToolsCount(String toolsType, String key);

	List<Tools> findToolsPager(int currentPage, int pageSize, String toolsType, String key);

	List<String> findToolsType();

}
