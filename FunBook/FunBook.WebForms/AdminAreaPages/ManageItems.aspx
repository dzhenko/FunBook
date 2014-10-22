<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAreaPages/AdminsMasterPage.master" AutoEventWireup="true" CodeBehind="ManageItems.aspx.cs" Inherits="FunBook.WebForms.AdminAreaPages.ManageItems" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdminArea" runat="server">
    <asp:ListView ID="ListView1" runat="server"
        OnSorting="ListView1_Sorting"
        DataKeyNames="Id" 
        ItemType="FunBook.Models.Joke"
        SelectMethod="ListView1_GetData"
        UpdateMethod="ListView1_UpdateItem"
        DeleteMethod="ListView1_DeleteItem"> <%--DataSourceID="SqlDataSourceItems"--%>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">
                                    <asp:LinkButton ID="lnkText" runat="server" CommandName="Sort" CommandArgument="Text">Text</asp:LinkButton></th>
                                <th runat="server">
                                    <asp:LinkButton ID="lnkTitle" runat="server" CommandName="Sort" CommandArgument="Title">Title</asp:LinkButton></th>
                                <th></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Label runat="server" ID="TextLabel" Text='<%#: Item.Text %>'></asp:Label></td> <%--<%# Eval("Text") %>--%>
                <td>
                    <asp:Label runat="server" ID="TitleLabel" Text='<%#: Item.Title %>'></asp:Label></td> <%--<%# Eval("Title") %>--%>
                <td>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC">
                <td>
                    <asp:Label runat="server" ID="TextLabel" Text='<%#: Item.Text %>'></asp:Label>

                </td>
                <td>
                    <asp:Label runat="server" ID="TitleLabel" Text='<%#: Item.Title %>'></asp:Label>

                </td>
                <td>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>

                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            </tr>
                    <td>
                        <asp:TextBox ID="TextTextBox" runat="server" Text='<%#: Item.Text %>' />
                    </td>
            <td>
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%#: Item.Title %>' />
            </td>
            <td>
                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:TextBox ID="TextTextBox" runat="server" Text='<%#: Item.Text %>'></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%#: Item.Title %>' />
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>

        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Label ID="TextLabel" runat="server" Text='<%#: Item.Text %>' />
                </td>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' />
                </td>
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    <%--<asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=FunBook;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Jokes]"></asp:SqlDataSource>--%>
</asp:Content>
