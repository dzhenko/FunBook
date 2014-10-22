<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Content" %>

<asp:Content ID="MainItemsContent" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <h3 class="content-title">Jokes</h3>
    <asp:ListView ID="JokesView" runat="server"
        SelectMethod="JokesView_GetData"
        ItemType="FunBook.Models.Joke"
        AllowPaging="True" AllowSorting="True"
        DataKeyNames="Id"
        AutoGenerateColumns="false">
        <ItemTemplate runat="server">
            <asp:Label CssClass="item-title" runat="server">
                <%# Item.Title %>
            </asp:Label>
            <asp:Label CssClass="item-text" runat="server">
                <%# Item.Text %>
                <small class="date"><%# Item.Created %></small>
            </asp:Label>
        </ItemTemplate>
        <EmptyDataTemplate runat="server">
            <h5 class="content-empty">No items available</h5>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerJokes" PagedControlID="JokesView" PageSize="4" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
        </Fields>
    </asp:DataPager>

    <h3 class="content-title">Links</h3>
    <asp:ListView ID="LinksView" runat="server"
        SelectMethod="LinksView_GetData"
        ItemType="FunBook.Models.Link"
        AllowPaging="True" PageSize="4" AllowSorting="True"
        DataKeyNames="Id"
        AutoGenerateColumns="false">
        <ItemTemplate>
            <asp:Label CssClass="item-title" runat="server">
                <%# Item.Title %>
            </asp:Label>
            <asp:Label CssClass="item-text" runat="server">
                <a href="<%# Item.URL %>"><%# Item.URL %></a>
                <small class="date"><%# Item.Created %></small>
            </asp:Label>
        </ItemTemplate>
        <EmptyDataTemplate>
            <h5 class="content-empty">No items available</h5>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerLinks" PagedControlID="LinksView" PageSize="4" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
        </Fields>
    </asp:DataPager>

    <h3 class="content-title">Pictures</h3>
    <asp:ListView ID="PicturesView" runat="server"
        SelectMethod="PicturesView_GetData"
        ItemType="FunBook.Models.Picture"
        AllowPaging="True" PageSize="4" AllowSorting="True"
        DataKeyNames="Id"
        AutoGenerateColumns="false">
        <ItemTemplate>
            <asp:Label CssClass="item-title" runat="server">
                <%# Item.Title %>
            </asp:Label>
            <asp:Label CssClass="item-text" runat="server">
               <a href="<%# Item.UrlPath %>"><%# Item.UrlPath %></a>
               <small class="date"><%# Item.Created %></small>
            </asp:Label>
        </ItemTemplate>
        <EmptyDataTemplate>
            <h5 class="content-empty">No items available</h5>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerPictures" PagedControlID="PicturesView" PageSize="4" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
        </Fields>
    </asp:DataPager>
</asp:Content>
