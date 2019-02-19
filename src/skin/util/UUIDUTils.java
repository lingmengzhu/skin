package skin.util;

import java.util.UUID;

public class UUIDUTils {

	public static String getUUId(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
