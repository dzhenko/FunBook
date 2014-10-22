<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="PictureDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.PictureDetails" %>
    
<asp:Content ID="ContentPicture" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="pic-main-container">
        <h3><%= CurrentPicture.Title %></h3>
        <section id="joke-text" >
            <p><span id="open-link"><a href="<%= CurrentPicture.UrlPath %>" target="_blank"><img id="picture-details-image" alt="Picture Details Page" src="<%= CurrentPicture.UrlPath %>" /></a></span></p>
        </section>
        <section id="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentPicture.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentPicture.Category.Name %></span></a></li>
                <li class="button"><a>Created <span class="badge"><%= CurrentPicture.Created %></span></a></li>
            </ul>
        </section>
    </section>
</asp:Content>
