using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;

public static class Database
{
    public static SqlConnection GetSqlConnection()
    {
        Uri uri = new Uri(ConfigurationManager.AppSettings["SQLSERVER_URI"]);
        string connectionString = new SqlConnectionStringBuilder
        {
            DataSource = uri.Host,
            InitialCatalog = uri.AbsolutePath.Trim('/'),
            UserID = uri.UserInfo.Split(':').First(),
            Password = uri.UserInfo.Split(':').Last(),
            MultipleActiveResultSets = true
        }.ConnectionString;

        return new SqlConnection(connectionString);
    }
}