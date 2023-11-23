public class DBConn
{
    public private dbConn;
    public static Connection getConnection()
    {
        if(dbConn == null)
        {
            String url = "jdbc:oracle:thin:@loacalhost:1541:xe";
            String user = "scott";
            String pwd = "tiger";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManger.getConnection(url,user,pwd);
        }

        return dbConn;
    }

    public static Connection getConnection()
    {
        if(dbConn == null)
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(url,user,pwd);
        }

        return dbConn;
    }

    public static Close()
    {
        if(dbConn != null){
            if(dbConn != isClosed)
                dbConn.isClosed;
        }

        return dbConn;
    }

}