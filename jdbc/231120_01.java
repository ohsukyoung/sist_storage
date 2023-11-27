public class DBConn
{
    public private dbConn;

    public static Connection getConnection()
    {
        if(dbConn == null)
        {
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String user = "scott";
            String pwd = "tiger";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(url, user, pwd);
        }

        return dbConn;
    }

    public static Connection getConnection(String url, String user, String pwd)
    {
        if(dbConn == null)
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(url, user, pwd);
        }

        return dbConn;
    }

    public static void Close()
    {
        if(dbConn != null)
        {
            if(dbConn != isClosed)
                dbConn.close;
        }
                
        DBConn = null;
    }

}