
Partial Class Category
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Form.DefaultButton = Me.btnSearch.UniqueID
        If Me.dsBudgetMgrDB.ConnectionString = "" Then
            Me.dsBudgetMgrDB.ConnectionString = ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
        End If
        If Not Me.IsPostBack Then
            gvCategory_DataBind()
        End If
    End Sub

    Private Sub gvCategory_DataBind()
        Me.gvCategory.DataBind()
    End Sub

    Protected Sub btnSearch_OnClick(sender As Object, e As EventArgs)
        Me.gvCategory.PageIndex = 0
        gvCategory_DataBind()
        If Me.txtSearchCategoryName.Text = "" Then
            Me.btnSearchClear.Visible = False
        Else
            Me.btnSearchClear.Visible = True
        End If
    End Sub

    Private Sub ResetSearchForm()
        Me.txtSearchCategoryName.Text = ""
        Me.btnSearchClear.Visible = False
        Me.gvCategory.PageIndex = 0
    End Sub

    Protected Sub btnSearchClear_OnClick(sender As Object, e As EventArgs)
        ResetSearchForm()
        gvCategory_DataBind()
    End Sub

    Protected Sub gvCategory_OnSorting(sender As Object, e As GridViewSortEventArgs)
        gvCategory_DataBind()
    End Sub

    Protected Sub gvCategory_OnPaging(sender As Object, e As GridViewPageEventArgs)
        Me.gvCategory.PageIndex = e.NewPageIndex
        gvCategory_DataBind()
    End Sub
    Protected Sub gvCategory_RowEditing(sender As Object, e As GridViewEditEventArgs)
        Me.gvCategory.EditIndex = e.NewEditIndex
        gvCategory_DataBind()
    End Sub

    Protected Sub gvCategory_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        Me.gvCategory.EditIndex = -1
        gvCategory_DataBind()
    End Sub

    Protected Sub dsBudgetMgrDB_OnUpdating(sender As Object, e As SqlDataSourceCommandEventArgs)
        Dim gvCategoryRow As GridViewRow = Me.gvCategory.Rows(Me.gvCategory.EditIndex)
        Dim txtCategoryName As TextBox = gvCategoryRow.FindControl("txtCategoryName")
        Dim strCategoryName As String = txtCategoryName.Text
        'Dim strUpdatedBy As String = System.Web.HttpContext.Current.User.Identity.Name
        e.Command.Parameters("@CategoryName").Value = strCategoryName
        gvCategoryRow.Dispose()
        txtCategoryName.Dispose()
    End Sub

    Protected Sub dsBudgetMgrDB_OnInserting(sender As Object, e As SqlDataSourceCommandEventArgs)
        Dim gvCategoryFooterRow As GridViewRow = Me.gvCategory.FooterRow
        Dim txtNewCategoryName As TextBox = gvCategoryFooterRow.FindControl("txtNewCategoryName")
        Dim txtNewCategoryDescription As TextBox = gvCategoryFooterRow.FindControl("txtNewCategoryDescription")
        Dim strNewCategoryName As String = txtNewCategoryName.Text
        Dim strNewCategoryDescription As String = txtNewCategoryDescription.Text
        'Dim strCreatedBy As String = System.Web.HttpContext.Current.User.Identity.Name
        e.Command.Parameters("@CategoryName").Value = strNewCategoryName
        e.Command.Parameters("@CategoryDescription").Value = strNewCategoryDescription
        gvCategoryFooterRow.Dispose()
        txtNewCategoryName.Dispose()
        txtNewCategoryDescription.Dispose()
    End Sub

    Protected Sub gvCategory_OnRowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "Insert" Then
            Me.dsBudgetMgrDB.Insert()
            ResetSearchForm()
            gvCategory_DataBind()
        End If
    End Sub
End Class