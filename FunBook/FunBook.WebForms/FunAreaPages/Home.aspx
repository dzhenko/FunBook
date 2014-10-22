<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Home" %>

<asp:Content ID="ContentHome" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="recent container">
        <asp:GridView runat="server" ID="recentItemsGrid" CssClass="items-grid"
            AutoGenerateColumns="false" ItemType="FunBook.WebForms.DataModels.HomeItemDataModel">
            <Columns>
                <asp:TemplateField HeaderText="Most Recent">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# Eval("Id", "~/Details.aspx/{0}") %>'
                            CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                        <asp:Label CssClass="item-text" runat="server">
                            <%# Item.Content %>
                            <small class="date"><%# Item.Created %></small>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="popular container">
        <asp:GridView runat="server" ID="popularItemsGrid" CssClass="items-grid"
            AutoGenerateColumns="false" ItemType="FunBook.WebForms.DataModels.HomeItemDataModel">
            <Columns>
                <asp:TemplateField HeaderText="Most Popular">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# Eval("Id", "~/Details.aspx/{0}") %>'
                            CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                        <asp:Label CssClass="item-text" runat="server">
                            <%# Item.Content %>
                            <small class="date"><%# Item.Created %></small>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
