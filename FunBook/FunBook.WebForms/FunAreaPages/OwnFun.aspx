<%@ Page Title="" 
    Language="C#" 
    MasterPageFile="~/FunAreaPages/FunMasterPage.master" 
    AutoEventWireup="true" 
    CodeBehind="OwnFun.aspx.cs" 
    Inherits="FunBook.WebForms.FunAreaPages.Create" %>

<asp:Content ID="OwnFun" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <h1>Created by <%: Context.User.Identity.GetUserName().Split('@')[0]  %> </h1>
 
    <ul class="nav nav-tabs">
        <li class="active" runat="server" id="liJoke"><a href="#home" data-toggle="tab">Jokes</a></li>
        <li class="" runat="server" id="liLink"><a href="#links" data-toggle="tab">Links</a></li>
        <li class="" runat="server" id="liPic"><a href="#pics" data-toggle="tab">Pics</a></li>
    </ul>
    <div id="myTabContent" class="tab-content" runat="server">
        <div class="tab-pane fade active in" id="home">
            <asp:ListView ID="ListViewJokes" runat="server" ItemType="FunBook.Models.Joke">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
 
                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>
 
                <ItemTemplate>
                    <div class="joke-item">
                        <h4><%#: Item.Title %></h4>
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="tab-pane fade" id="links">
            <asp:ListView ID="ListViewLinks" runat="server" ItemType="FunBook.Models.Link">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
 
                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>
 
                <ItemTemplate>
                    <div class="link-item">
                        <h4><%#: Item.Title %></h4>
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="tab-pane fade" disabled="true" id="pics">
            <asp:ListView ID="ListViewPics" runat="server" ItemType="FunBook.Models.Picture">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>
 
                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>
 
                <ItemTemplate>
                    <div class="link-item">
                        <h4><%#: Item.Title %></h4>
                        <img src="<%#: Item.FilePath %>" />
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
