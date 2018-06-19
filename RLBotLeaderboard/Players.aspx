<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Players.aspx.cs" Inherits="Players" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div style="width: 1000px">
        <asp:GridView ID="gvPlayers" runat="server" AllowPaging="True" DataSourceID="PlayersDataSource" AutoGenerateColumns="False" GridLines="None"
            CssClass="GridView" HeaderStyle-CssClass="GridViewHeader" RowStyle-CssClass="GridViewRow" PagerStyle-CssClass="GridViewPager">
            <Columns>
                <asp:BoundField DataField="Account ID" HeaderText="Account ID" />
                <asp:BoundField DataField="1v1 Elo" HeaderText="1v1 Elo" HeaderStyle-Width="100" />
                <asp:BoundField DataField="2v2 Elo" HeaderText="2v2 Elo" HeaderStyle-Width="100" />
                <asp:BoundField DataField="3v3 Elo" HeaderText="3v3 Elo" HeaderStyle-Width="100" />
                <asp:BoundField DataField="Joined" HeaderText="Joined" DataFormatString="{0:d}" HtmlEncode="False" HeaderStyle-Width="100" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PlayersDataSource" runat="server" SelectCommand="SELECT UniqueID AS 'Account ID', Elo1s AS '1v1 Elo', Elo2s AS '2v2 Elo', Elo3s AS '3v3 Elo', CAST(JoinDate as Date) AS 'Joined' FROM UserInfo ORDER BY UniqueID" />
    </div>
</asp:Content>