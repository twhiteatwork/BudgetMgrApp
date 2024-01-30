<%@ Page Title="Categories" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Category.aspx.vb" Inherits="Category" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="dsBudgetMgrDB"
        runat="server"
        SelectCommand="SELECT
	                    CategoryName,
	                    CategoryDescription
                    FROM Category"
        FilterExpression="CategoryName LIKE '%{0}%'"
        OnInserting="dsBudgetMgrDB_OnInserting"
        InsertCommandType="Text"
        InsertCommand="INSERT INTO Category (
	                    CategoryName,
	                    CategoryDescription
                    )
                    VALUES (
	                    @CategoryName,
	                    @CategoryDescription
                    )"
        OnUpdating="dsBudgetMgrDB_OnUpdating"
        UpdateCommandType="Text"
        UpdateCommand="UPDATE Category
                    SET CategoryDescription = @CategoryDescription
                    WHERE CategoryName = @CategoryName">
        <FilterParameters>
            <asp:ControlParameter Name="CategoryName" ControlID="txtSearchCategoryName" PropertyName="Text" ConvertEmptyStringToNull="false"/>
        </FilterParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" Direction="Input" />
            <asp:Parameter Name="CategoryDescription" Type="String" Direction="Input" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryDescription" Type="String" Direction="Input" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h2><%: Title %></h2>
    <p>Add and edit categories.</p>
    <asp:Table runat="server" BorderWidth="1px" CssClass="searchform">
        <asp:TableRow>
            <asp:TableHeaderCell>CategoryName:</asp:TableHeaderCell>
            <asp:TableCell><asp:TextBox ID="txtSearchCategoryName" runat="server" MaxLength="50"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow CssClass="searchform-footerrow">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnSearchClear" runat="server" Text="Clear" OnClick="btnSearchClear_OnClick" Visible="false" />
                &nbsp;
                <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_OnClick" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
    <asp:GridView ID="gvCategory"
        runat="server"
        DataSourceID = "dsBudgetMgrDB"
        CssClass="gridview"
        AlternatingRowStyle-CssClass="even"
        FooterStyle-CssClass="gridview-footerrow"
        ShowHeaderWhenEmpty="true"
        AllowSorting="true"
        AllowPaging="true"
        ShowFooter="true"
        OnSorting="gvCategory_OnSorting"
        OnRowCommand="gvCategory_OnRowCommand"
        OnPageIndexChanging="gvCategory_OnPaging"
        OnRowEditing="gvCategory_RowEditing"
        OnRowCancelingEdit="gvCategory_RowCancelingEdit"
        AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                <ItemTemplate>
                    <asp:Literal runat="server" Text='<%# Eval("CategoryName") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtIdentityInstanceName" runat="server" Text='<%# Eval("CategoryName") %>' MaxLength="50"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Textbox ID="txtNewCategoryName" runat="server" MaxLength="50"></asp:Textbox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CategoryDescription" SortExpression="CategoryDescription">
                <ItemTemplate>
                    <asp:Literal runat="server" Text='<%# Eval("CategoryDescription") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCategoryDescription" runat="server" Text='<%# Eval("CategoryDescription") %>' MaxLength="200"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Textbox ID="txtNewCategoryDescription" runat="server" MaxLength="200"></asp:Textbox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button runat="Server" Text="Insert" CommandName="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
