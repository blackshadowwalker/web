package modules.base;

public class PageManFactory {

	public static PageMan getInstance(){
		
		return new OraclePageMan();
	}
}
