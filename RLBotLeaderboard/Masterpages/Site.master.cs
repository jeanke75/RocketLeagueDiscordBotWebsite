using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterpages_Site : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MainMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        switch (e.Item.Text)
        {
            case "All-time":
                if (e.Item.Parent.Text == "Standard")
                    Session["PlaylistType"] = PlaylistType.Standard;
                else if (e.Item.Parent.Text == "Duo")
                    Session["PlaylistType"] = PlaylistType.Duo;
                else
                    Session["PlaylistType"] = PlaylistType.Solo;
                Session["LeaderboardType"] = LeaderboardType.AllTime;
                Response.Redirect("Leaderboard.aspx");
                break;
            case "Monthly":
                if (e.Item.Parent.Text == "Standard")
                    Session["PlaylistType"] = PlaylistType.Standard;
                else if (e.Item.Parent.Text == "Duo")
                    Session["PlaylistType"] = PlaylistType.Duo;
                else
                    Session["PlaylistType"] = PlaylistType.Solo;
                Session["LeaderboardType"] = LeaderboardType.Monthly;
                Response.Redirect("Leaderboard.aspx");
                break;
        }
    }
}