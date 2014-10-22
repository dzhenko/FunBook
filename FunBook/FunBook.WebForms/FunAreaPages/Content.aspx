<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Content" %>

<asp:Content ID="MainItemsContent" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <asp:ListView ID="JokesView" runat="server"
        SelectMethod="JokesView_GetData"
        ItemType="FunBook.Models.Joke"
        AllowPaging="True" AllowSorting="True"
        DataKeyNames="Id"
        AutoGenerateColumns="false">
        <ItemTemplate>
            <asp:Label CssClass="item-title" runat="server">
                <%# Item.Title %>
            </asp:Label>
            <asp:Label CssClass="item-text" runat="server">
                <%# Item.Text %>
                <small class="date"><%# Item.Created %></small>
            </asp:Label>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
