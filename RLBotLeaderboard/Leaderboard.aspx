<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Leaderboard.aspx.cs" Inherits="Leaderboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div style="width: 1000px">
        <asp:GridView ID="gvLeaderboard" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" Gridlines="None"
            CssClass="GridView" HeaderStyle-CssClass="GridViewHeader" RowStyle-CssClass="GridViewRow" Pagerstyle-CssClass="GridViewPager" ShowHeaderWhenEmpty="true" EmptyDataText="No data found!">
            <Columns>
                <asp:BoundField DataField="Rank" HeaderText="Rank" ReadOnly="True" SortExpression="Rank" Headerstyle-Width="75px" />
                <asp:BoundField DataField="Account ID" HeaderText="Account ID" SortExpression="Account ID" />
                <asp:BoundField DataField="Wins" HeaderText="Wins" ReadOnly="True" SortExpression="Wins" Headerstyle-Width="100px" />
                <asp:BoundField DataField="Played" HeaderText="Played" ReadOnly="True" SortExpression="Played" Headerstyle-Width="100px" />
            </Columns>
            <EmptyDataTemplate>No data available!</EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="AllTimeDataSource" runat="server" SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY x.Wins DESC, x.TotalGames ASC) AS Rank, UniqueID AS 'Account ID', Wins, TotalGames AS Played FROM (SELECT qp.UserID, ISNULL(SUM(CASE WHEN ((qp.Team = 0 AND q.ScoreTeamA &gt; q.ScoreTeamB) OR (qp.Team = 1 AND q.ScoreTeamA &lt; q.ScoreTeamB)) THEN 1 END), 0) AS Wins, COUNT(1) AS TotalGames FROM Queue AS q INNER JOIN QueuePlayer AS qp ON qp.QueueID = q.QueueID WHERE ((q.Playlist = @Playlist) AND ( (q.ScoreTeamA &gt; 0) OR (q.ScoreTeamB &gt; 0) OR (DATEDIFF(hour, q.Created, GETDATE()) &gt; 24))) GROUP BY qp.UserID) AS x INNER JOIN UserInfo u ON u.UserID = x.UserID" />
        <asp:SqlDataSource ID="MonthlyDataSource" runat="server" SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY x.Wins DESC, x.TotalGames ASC) AS Rank, ui.UniqueID AS 'Account ID', x.Wins, x.TotalGames AS Played FROM ( SELECT qp.UserID, ISNULL(SUM(CASE WHEN ((qp.Team = 0 AND q.ScoreTeamA &gt; q.ScoreTeamB) OR (qp.Team = 1 AND q.ScoreTeamA &lt; q.ScoreTeamB)) THEN 1 END), 0) AS Wins, COUNT(1) AS TotalGames FROM Queue AS q INNER JOIN QueuePlayer AS qp ON qp.QueueID = q.QueueID WHERE (q.ScoreTeamA &gt; 0) AND (q.Created &gt;= CAST(DATEADD(dd, - DAY(GETDATE()) + 1, GETDATE()) AS DATE)) AND (q.Created &lt; CAST(DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, 0) AS DATE)) AND (q.Playlist = 1) OR (q.Created &gt;= CAST(DATEADD(dd, - DAY(GETDATE()) + 1, GETDATE()) AS DATE)) AND (q.Created &lt; CAST(DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, 0) AS DATE)) AND (q.Playlist = 1) AND (q.ScoreTeamB &gt; 0) OR (q.Created &gt;= CAST(DATEADD(dd, - DAY(GETDATE()) + 1, GETDATE()) AS DATE)) AND (q.Created &lt; CAST(DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, 0) AS DATE)) AND (q.Playlist = 1) AND (DATEDIFF(hour, q.Created, GETDATE()) &gt; 24) GROUP BY qp.UserID ) AS X INNER JOIN UserInfo ui ON ui.UserID = x.UserID" />
    </div>
</asp:Content>