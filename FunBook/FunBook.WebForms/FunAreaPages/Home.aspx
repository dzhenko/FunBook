<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Home" %>

<%@ OutputCache Duration="5" VaryByParam="none" %>

<asp:Content ID="ContentHome" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <asp:GridView runat="server" ID="recentItemsGrid" CssClass="items-grid"
        AutoGenerateColumns="false" ItemType="FunBook.WebForms.DataModels.HomeItemDataModel">
        <Columns>
            <asp:TemplateField HeaderText="Most Recent">
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'
                        CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                    <asp:Label CssClass="item-text" runat="server">
                            <%# Item.Content %>
                            <small class="date"><%# Item.Created %></small>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView runat="server" ID="popularItemsGrid" CssClass="items-grid"
        AutoGenerateColumns="false" ItemType="FunBook.WebForms.DataModels.HomeItemDataModel">
        <Columns>
            <asp:TemplateField HeaderText="Most Popular">
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# "PrivateFunDetails/" + Item.DetailsUrl %>'
                        CssClass="item-title" runat="server"><%# Item.Title %></asp:HyperLink>
                    <asp:Label CssClass="item-text" runat="server">
                            <%# Item.Content %>
                            <small class="date"><%# Item.Created %></small>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
