<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="JokeDetails.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.JokeDetails" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="joke-main-container">
        <h3><%= CurrentJoke.Title %></h3>
        <section id="fun-content">
            <p><%= CurrentJoke.Text %></p>
        </section>
        <section class="joke-info">
            <ul class="nav nav-pills">
                <li class="button"><a>Views <span class="badge"><%= CurrentJoke.Views.Count %></span></a></li>
                <li class="button"><a>Category <span class="badge"><%= CurrentJoke.Category.Name %></span></a></li>
                <li class="button"><a>Created <span class="badge"><%= CurrentJoke.Created %></span></a></li>
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
                                <p class="text-success"><%= CurrentJoke.Views.Where(v=>v.Liked==true).Count() %></p>
                            </div>
                            <div class="col-md-5">
                                <asp:ImageButton runat="server" ID="BtnNoImage" OnClick="Hate_Click" ImageUrl="~/Content/Images/no.png" />
                                <p class="text-success"><%= CurrentJoke.Views.Where(v=>v.Liked==false).Count() %></p>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>
