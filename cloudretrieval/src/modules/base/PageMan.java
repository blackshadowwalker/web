package modules.base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface PageMan {

	public long getCurPage();
	
	public long getTotalRow();
	
	public long getTotalPage();
	
	public void close(boolean closeCon);
	
	public ResultSet list(Connection con,int perPage,int curPage,String countSQL,String sqls) throws SQLException;
}
