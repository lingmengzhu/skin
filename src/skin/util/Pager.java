package skin.util;
import java.io.Serializable;
import java.util.List;

/**
 * <b> 分页通用类 </b>
 * 
 */
public class Pager<T> implements Serializable {

    private static final long serialVersionUID = 4542617637761955078L;
    private int currentPage = 1;
    private int pageSize = 6;
    private int pageTotal;
    private int recordTotal = 0;
    private List<T> content;
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getRecordTotal() {
		return recordTotal;
	}

	public void setRecordTotal(int recordTotal) {
		this.recordTotal = recordTotal;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Pager [currentPage=" + currentPage + ", pageSize=" + pageSize + ", pageTotal=" + pageTotal
				+ ", recordTotal=" + recordTotal + ", content=" + content + "]";
	}

   
    
    

}
