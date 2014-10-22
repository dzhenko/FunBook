<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.Home" %>

<asp:Content ID="ContentHome" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="recent col-sm-6">
        <asp:GridView runat="server" ID="recentItemsGrid" CssClass="items-grid" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Most Recent">
                    <ItemTemplate>
                        <asp:Label CssClass="item-title" runat="server"><%# Eval("Title") %></asp:Label>
                        <asp:Label CssClass="item-text" runat="server">
                            <%# Eval("Text") %>
                            <small class="date"><%# Eval("Created") %></small>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="popular col-sm-6">
        <asp:GridView runat="server" ID="popularItemsGrid" CssClass="items-grid" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Most Popular">
                    <ItemTemplate>
                        <asp:Label CssClass="item-title" runat="server"><%# Eval("Title") %></asp:Label>
                        <asp:Label CssClass="item-text" runat="server">
                            <%# Eval("Text") %>
                            <small class="date"><%# Eval("Created") %></small>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
