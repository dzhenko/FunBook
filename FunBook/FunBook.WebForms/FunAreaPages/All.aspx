﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.All" %>

<asp:Content ID="ContentAllFun" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="row jokes-content">
        <asp:ListView ID="ViewAllFun" runat="server"
            SelectMethod="GridViewAll_GetData"
            ItemType="FunBook.WebForms.DataModels.HomeItemDataModel"
            AllowPaging="True" AllowSorting="True"
            DataKeyNames="Id"
            AutoGenerateColumns="false">
            <LayoutTemplate>
                <div>
                    <asp:LinkButton runat="server" ID="SortByTitle" CssClass="content-title-all col-sm-3" CommandName="Sort" CommandArgument="Title">Title</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="SortByContent" CssClass="content-title-all col-sm-6" CommandName="Sort" CommandArgument="Content">Content</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="SortByCreated" CssClass="content-title-all col-sm-2 col-sm-offset-1" CommandName="Sort" CommandArgument="Created">Created</asp:LinkButton>
                </div>
                <div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate runat="server">
                <asp:Label CssClass="col-sm-3" runat="server">
                <%# Item.Title%>
                </asp:Label>
                <asp:HyperLink CssClass="col-sm-7" runat="server">
                <%# Item.Content.Substring(0, Math.Min(100, Item.Content.Length)) %>...
                </asp:HyperLink>
                <asp:Label CssClass="date col-sm-2" runat="server"><%# Item.Created %></asp:Label>
            </ItemTemplate>
            <EmptyDataTemplate runat="server">
                <h5 class="content-empty">No items available</h5>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    <asp:DataPager ID="DataPagerAll" PagedControlID="ViewAllFun" PageSize="10" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary btn-xs" />
        </Fields>
    </asp:DataPager>

</asp:Content>
