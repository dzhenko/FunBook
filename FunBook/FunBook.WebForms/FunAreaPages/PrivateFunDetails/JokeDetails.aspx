﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="JokeDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.JokeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="joke-main-container">
        <h3><%= CurrentJoke.Title %></h3>
        <section id="joke-text">
            <p><%= CurrentJoke.Text %></p>
        </section>
        <section class="joke-comments" id="jokeComments" runat="server">
            <ul class="list-group">
                <li class="list-group-item active">Comments</li>
                <asp:Repeater ID="RepeaterComments" runat="server" ItemType="FunBook.Models.Comment">
                    <ItemTemplate>
                        <li class="list-group-item"><%# Item.Text %></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </section>
        <section id="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentJoke.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentJoke.Category.Name %></span></a></li>
            </ul>
        </section>
    </section>
</asp:Content>
