﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="PictureDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.PictureDetails" %>

<asp:Content ID="ContentPicture" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="fun-main-container">
        <h3><%= CurrentPicture.Title %></h3>
    </section>
    <section id="fun-content">
        <p class="text-center">
            <img id="picture-details-image" alt="Picture Details Page" src="<%= CurrentPicture.UrlPath %>" />
        </p>
        <section class="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentPicture.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentPicture.Category.Name %></span></a></li>
                <li class="button"><a>Created <span class="badge"><%= CurrentPicture.Created %></span></a></li>
            </ul>
        </section>
        <section class="joke-comments" id="jokeComments" runat="server">
            <ul class="list-group">
                <li class="list-group-item active">Comments</li>
                <asp:Repeater ID="RepeaterComments" runat="server" ItemType="FunBook.Models.Comment">
                    <ItemTemplate>
                        <li class="list-group-item"><%# Item.Text %><span class="badge alert-info"><%# Item.Created.ToString("hh:mm dd-MM-yyyy") %></span></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </section>
        <div class="row">
            <div class="col-md-5 col-md-offset-1">
                <div class="row">
                    <textarea runat="server" rows="5" id="CommentText" class="form-control"></textarea>
                    <asp:Button CssClass="btn btn-md btn-primary" Text="Add Comment" runat="server" OnClick="Comment_Click" />
                </div>
            </div>
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="col-md-5 col-md-offset-1">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:ImageButton runat="server" ID="BtnYesImage" OnClick="Like_Click" ImageUrl="~/Content/Images/yes.png" />
                                <p class="text-success"><%= CurrentPicture.Views.Where(v=>v.Liked==true).Count() %></p>
                            </div>
                            <div class="col-md-5">
                                <asp:ImageButton runat="server" ID="BtnNoImage" OnClick="Hate_Click" ImageUrl="~/Content/Images/no.png" />
                                <p class="text-success"><%= CurrentPicture.Views.Where(v=>v.Liked==false).Count() %></p>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>
