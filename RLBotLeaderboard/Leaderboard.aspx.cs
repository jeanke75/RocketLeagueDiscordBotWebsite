using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Leaderboard : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LeaderboardType leaderboardType = (Session["LeaderboardType"] != null ? (LeaderboardType)Session["LeaderboardType"] : LeaderboardType.Monthly);
            PlaylistType playlistType = (Session["PlaylistType"] != null ? (PlaylistType)Session["PlaylistType"] : PlaylistType.Standard);

            SqlDataSource source = (leaderboardType == LeaderboardType.AllTime ? AllTimeDataSource : MonthlyDataSource);
            source.ConnectionString = Database.GetSqlConnection().ConnectionString;
            source.SelectParameters.Add("Playlist", ((int)playlistType).ToString());
            gvLeaderboard.DataSource = source;
            gvLeaderboard.DataBind();
        }
    }
}