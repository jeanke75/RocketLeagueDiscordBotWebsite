using System;

public partial class Players : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PlayersDataSource.ConnectionString = Database.GetSqlConnection().ConnectionString;
        }
    }
}