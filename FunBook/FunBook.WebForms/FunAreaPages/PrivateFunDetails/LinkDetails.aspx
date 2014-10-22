﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="LinkDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.LikeDetails" %>

<asp:Content ID="ContentLink" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="link-main-container">
        <h3><%= CurrentLink.Title %></h3>
        <%--<p class="button"><span id="open-link" class="badge"><a href="<%= CurrentLink.URL %>" target="_blank">Open Link</a></span></p>--%>
        <p><a href="<%= CurrentLink.URL %>" target="_blank" id="open-link" class="btn btn-default btn-lg btn-block">Open Link</a></p>
        <section class="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentLink.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentLink.Category.Name %></span></a></li>
                <li class="button"><a>Created <span class="badge"><%= CurrentLink.Created %></span></a></li>
            </ul>
        </section>
    </section>
</asp:Content>