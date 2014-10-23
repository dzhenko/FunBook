<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="PictureDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.PictureDetails" %>
    
<asp:Content ID="ContentPicture" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="fun-main-container">
        <h3><%= CurrentPicture.Title %></h3>
        <section class="fun-details-manageBtns">
            <ul class="nav nav-pills">
                <li class="button">
                    <asp:LinkButton ID="LinkButtonEditLink" OnCommand="LinkButtonEditPicture_Command" runat="server">
                        Edit
                    </asp:LinkButton></li>
                <li class="button">
                    <asp:LinkButton ID="LinkButtonDeleteLink" OnCommand="LinkButtonDeletePicture_Command" runat="server">
                        Delete
                    </asp:LinkButton>
                </li>
            </ul>
        </section>
        <section id="fun-content" >
            <p><span id="open-link"><a href="<%= CurrentPicture.UrlPath %>" target="_blank"><img id="picture-details-image" alt="Picture Details Page" src="<%= CurrentPicture.UrlPath %>" /></a></span></p>
            <section class="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentPicture.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentPicture.Category.Name %></span></a></li>
                <li class="button"><a>Created <span class="badge"><%= CurrentPicture.Created %></span></a></li>
            </ul>
        </section>
        </section>
    </section>
</asp:Content>
