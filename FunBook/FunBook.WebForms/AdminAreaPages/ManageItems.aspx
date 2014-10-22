<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAreaPages/AdminsMasterPage.master" AutoEventWireup="true" CodeBehind="ManageItems.aspx.cs" Inherits="FunBook.WebForms.AdminAreaPages.ManageItems" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdminArea" runat="server">
    <asp:ListView ID="ListView1" runat="server"
        OnSorting="ListView1_Sorting"
        DataKeyNames="Id"
        ItemType="FunBook.Models.Joke"
        SelectMethod="ListView1_GetData"
        UpdateMethod="ListView1_UpdateItem"
        DeleteMethod="ListView1_DeleteItem">
        <LayoutTemplate>
            <div class="container">
                <table runat="server" class="table table-hover">
                    <tr runat="server" class="active">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" class="table table-striped">
                                <tr runat="server" class="active">
                                    <th runat="server" class="col-md-9">
                                        <asp:LinkButton ID="lnkText" runat="server" CommandName="Sort" CommandArgument="Text">Text</asp:LinkButton>

                                    </th>
                                    <th runat="server" class="col-md-2">
                                        <asp:LinkButton ID="lnkTitle" runat="server" CommandName="Sort" CommandArgument="Title">Title</asp:LinkButton>

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
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary"/>
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary"/>
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
                    <asp:Label runat="server" ID="TextLabel" Text='<%#: Item.Text %>'></asp:Label>

                </td>
                <td>
                    <asp:Label runat="server" ID="TitleLabel" Text='<%#: Item.Title %>'></asp:Label>

                </td>
                <td class="info">
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            </tr>
                    <td>
                        <asp:TextBox ID="TextTextBox" runat="server" Text='<%#: BindItem.Text %>' />
                    </td>
            <td>
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%#: BindItem.Title %>' />
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
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="TextTextBox" runat="server" Text='<%#: Item.Text %>'></asp:TextBox>

                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%#: Item.Title %>' />
                </td>
                <td class="info">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
