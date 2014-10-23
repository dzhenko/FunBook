<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAreaPages/AdminsMasterPage.master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="FunBook.WebForms.AdminAreaPages.ManageUsers" %>

<%@ Register TagPrefix="uc" TagName="ModalWindow" Src="~/Controls/ModalWindow/ModalWindow.ascx"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdminArea" runat="server">
    <asp:ListView ID="ListView" runat="server"
        OnSorting="ListView_Sorting"
        DataKeyNames="Id"
        ItemType="FunBook.WebForms.DataModels.AdminUserDataModel"
        SelectMethod="ListView_GetData"
        UpdateMethod="ListView_UpdateItem"
        DeleteMethod="ListView_DeleteItem">
        <LayoutTemplate>
            <div class="container">
                <div class="row center-block pull-right pink">
                    <div class="col-md-3">
                        <asp:LinkButton Text="Search" runat="server" ID="LinkButtonSearch" OnClick="LinkButtonSearch_Click" CssClass="btn btn-lg" />
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="TextBoxSearch" CssClass="form-control" />
                    </div>
                </div>

                <table runat="server" class="table table-hover">
                    <tr runat="server" class="active">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" class="table table-striped">
                                <tr runat="server" class="active">
                                    <th runat="server" class="col-md-9">
                                        <asp:LinkButton ID="lnkUsername" runat="server" CssClass="lead" CommandName="Sort" CommandArgument="Username">Email</asp:LinkButton>
                                    </th>
                                    <th runat="server" class="col-md-2">
                                        <asp:LinkButton ID="lnkEmail" runat="server" CssClass="lead" CommandName="Sort" CommandArgument="Email">Is Admin</asp:LinkButton>
                                    </th>
                                    <th class="col-md-1"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <asp:DataPager runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label runat="server" ID="EmailLabel" Text='<%#: Item.Email %>'></asp:Label>

                </td>
                <td>                                                      
                    <asp:CheckBox runat="server" ID="IsAdminValue" Enabled="false" Checked='<%# Eval("IsAdmin") %>'></asp:CheckBox>

                </td>
                <td>
                    <asp:LinkButton ID="lnkEdit" CssClass="btn btn-sm btn-primary" runat="server" CommandName="Edit">Edit</asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <td>
                <asp:TextBox ID="EmailTextBox" class="form-control" runat="server" Text='<%#: BindItem.Email %>' />
            </td>
            <td>
                <asp:CheckBox ID="IsAdminCheckBox" class="form-control" runat="server" Checked='<%# Eval("IsAdmin") %>' />
            </td>
            <td>
                <asp:LinkButton ID="lnkUpdate" CssClass="btn btn-sm btn-success" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="lnkDelete" CssClass="btn btn-sm btn-danger middleButtonAdminArea" 
                    runat="server" CommandName="Delete">Delete</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" CssClass="btn btn-sm btn-primary" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server">
                <tr>
                    <td class="text-center">
                        <div class="container">
                            <h2 class="menu text-center">No users were found.</h2>
                        </div>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%#: Item.Email %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsAdminCheck" runat="server" Checked='<%# Eval("IsAdmin") %>' />
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
    <asp:TextBox ID="HiddenfieldDeleteId" runat="server" Visible="false"></asp:TextBox>
    <uc:ModalWindow ID="ModalWindow" runat="server" OKButtonText="Delete" ModalWindowText="Are you sure you want to delete this user? This action is irreversible!" OnOKButtonClicked="ModalWindow_OKButtonClicked" />
    <script src="../Controls/ModalWindow/modalWindow.js"></script>
</asp:Content>
