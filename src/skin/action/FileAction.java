package skin.action;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.google.gson.Gson;

import skin.util.Struts2Utils;
public class FileAction {
    private File[] files;
	private String[] filesFileName;
	private String[] filesFileContentType;
    private Gson gson=new Gson();
	@Action(value = "/skin-admin/fileUpload")
	public void fileUpload() throws IOException {
		String dir="E:/upload/";
		System.out.println(files);
		int i = 0;
		List<String> ls = new ArrayList<>();
		for (File file : files) {
			String name=java.util.UUID.randomUUID().toString();
			String filename=name+filesFileName[i].substring(filesFileName[i].lastIndexOf("."));
			System.out.println(filesFileName[i]);
			File dirFile=new File(dir);
			if(!dirFile.exists()) {
				dirFile.mkdirs();
			}
			file.renameTo(new File(dir,filename));
			ls.add(filename);
			i++;
		}
		    String json=gson.toJson(ls);
			Struts2Utils.renderJson(json);
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}

	public String[] getFilesFileContentType() {
		return filesFileContentType;
	}

	public void setFilesFileContentType(String[] filesFileContentType) {
		this.filesFileContentType = filesFileContentType;
	}

}