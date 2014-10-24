<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Content" %>

<asp:Content ID="MainItemsContent" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#jokesContent" data-toggle="tab">
            <h3 class="content-title">Jokes</h3>
        </a></li>
        <li class=""><a href="#linksContent" data-toggle="tab">
            <h3 class="content-title">Links</h3>
        </a></li>
        <li class=""><a href="#picturesContent" data-toggle="tab">
            <h3 class="content-title">Pictures</h3>
        </a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="jokesContent">
            <asp:ListView ID="JokesView" runat="server"
                SelectMethod="JokesView_GetData"
                ItemType="FunBook.WebForms.DataModels.HomeItemDataModel"
                AllowPaging="True" AllowSorting="True"
                DataKeyNames="Id"
                AutoGenerateColumns="false">
                <LayoutTemplate>
                    <div class="sort-link">
                        <asp:LinkButton runat="server" ID="SortByTitle" CssClass="btn btn-sm btn-primary" CommandName="Sort" CommandArgument="Title">Sort by Title</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="SortByDate" CommandName="Sort" CssClass="btn btn-sm btn-primary" CommandArgument="Created">Sort by Date</asp:LinkButton>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate runat="server">
                    <asp:HyperLink NavigateUrl='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'
                            CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                    <asp:Label CssClass="item-text" runat="server">
                <%# Item.Content %>
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
        </div>
        <div class="tab-pane fade" id="linksContent">
            <asp:ListView ID="LinksView" runat="server"
                SelectMethod="LinksView_GetData"
                ItemType="FunBook.WebForms.DataModels.HomeItemDataModel"
                AllowPaging="True" PageSize="4" AllowSorting="True"
                DataKeyNames="Id"
                AutoGenerateColumns="false">
                <LayoutTemplate>
                    <div class="sort-link">
                        <asp:LinkButton runat="server" ID="SortByTitle" CssClass="btn btn-sm btn-primary" CommandName="Sort" CommandArgument="Title">Sort by Title</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="SortByDate" CommandName="Sort" CssClass="btn btn-sm btn-primary" CommandArgument="Created">Sort by Date</asp:LinkButton>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'
                            CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                    <asp:Label CssClass="item-text" runat="server">
                <a href='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'>Click to view link...</a>
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
        </div>
        <div class="tab-pane fade" id="picturesContent">


            <asp:ListView ID="PicturesView" runat="server"
                SelectMethod="PicturesView_GetData"
                ItemType="FunBook.WebForms.DataModels.HomeItemDataModel"
                AllowPaging="True" PageSize="4" AllowSorting="True"
                DataKeyNames="Id"
                AutoGenerateColumns="false">
                <LayoutTemplate>
                    <div class="sort-link">
                        <asp:LinkButton runat="server" ID="SortByTitle" CssClass="btn btn-sm btn-primary" CommandName="Sort" CommandArgument="Title">Sort by Title</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="SortByDate" CommandName="Sort" CssClass="btn btn-sm btn-primary" CommandArgument="Created">Sort by Date</asp:LinkButton>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'
                            CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                    <asp:Label CssClass="item-text" runat="server">
               <a href='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'>Click to view image...</a>
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
        </div>
    </div>
</asp:Content>
