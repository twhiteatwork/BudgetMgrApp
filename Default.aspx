<%@ Page Title="Home" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>BudgetMgr</h3>
    <p>Manage your budget to increase your wealth!</p>
    <p>Welcome, please select an option below or from menu above.</p>
    <hr />
    <asp:Table runat="server" CssClass="linklist">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Section</asp:TableHeaderCell>
            <asp:TableHeaderCell>Page</asp:TableHeaderCell>
            <asp:TableHeaderCell>Description</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>Settings</asp:TableCell>
            <asp:TableCell><a href="/Secure/Category.aspx">Categories</a></asp:TableCell>
            <asp:TableCell>Manage budget categories</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
