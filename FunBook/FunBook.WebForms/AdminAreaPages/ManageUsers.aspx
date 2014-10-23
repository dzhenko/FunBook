<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAreaPages/AdminsMasterPage.master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="FunBook.WebForms.AdminAreaPages.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdminArea" runat="server">
    <asp:ListView ID="ListView1" runat="server"
        OnSorting="ListView1_Sorting"
        DataKeyNames="Id"
        ItemType="FunBook.Models.User"
        SelectMethod="ListView1_GetData"
        UpdateMethod="ListView1_UpdateItem"
        DeleteMethod="ListView1_DeleteItem">
        <LayoutTemplate>
            <div class="container">
                <div class="row center-block">
                    <asp:TextBox runat="server" ID="TextBoxSearch" CssClass="form-control col-md-8" />
                    <asp:LinkButton Text="Search" runat="server" ID="LinkButtonSearch" OnClick="LinkButtonSearch_Click" CssClass="btn btn-lg" />
                </div>

                <table runat="server" class="table table-hover">
                    <tr runat="server" class="active">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" class="table table-striped">
                                <tr runat="server" class="active">
                                    <th runat="server" class="col-md-9">
                                        <asp:LinkButton ID="lnkUsername" runat="server" CommandName="Sort" CommandArgument="Username">Username</asp:LinkButton>

                                    </th>
                                    <th runat="server" class="col-md-2">
                                        <asp:LinkButton ID="lnkEmail" runat="server" CommandName="Sort" CommandArgument="Email">Email</asp:LinkButton>

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
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
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
                    <asp:Label runat="server" ID="UserNameLabel" Text='<%#: Item.UserName %>'></asp:Label>

                </td>
                <td>
                    <asp:Label runat="server" ID="EmailLabel" Text='<%#: Item.Email %>'></asp:Label>

                </td>
                <td class="info">
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <td>
                <asp:TextBox ID="UserNameTextBox" class="form-control"  runat="server" Text='<%#: BindItem.UserName %>' />
            </td>
            <td>
                <asp:TextBox ID="EmailTextBox" class="form-control" runat="server" Text='<%#: BindItem.Email %>' />
            </td>
            <td class="info">
                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
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
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%#: Item.UserName %>'></asp:TextBox>

                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%#: Item.Email %>' />
                </td>
                <td class="info">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
