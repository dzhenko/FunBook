<%@ Page 
    Title="" 
    Language="C#"
    MasterPageFile="~/FunAreaPages/FunMasterPage.master" 
    AutoEventWireup="true" 
    CodeBehind="JokeDetails.aspx.cs" 
    Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.JokeDetails" %>

<asp:Content ID="ContentJoke" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <section class="joke-main-container">
        <header>
            <h3><%= CurrentJoke.Title %></h3>
        </header>
        <section id="joke-text">
            <p><%= CurrentJoke.Text %></p>
        </section>
        <section id="joke-comments">
        </section>
        <section id="joke-left">
            <section id="joke-views">
            </section>
            <section id="joke-tags">
            </section>
            <section id="joke-category">
                <%= CurrentJoke.Category.Name %>
            </section>
        </section>
    </section>
</asp:Content>
