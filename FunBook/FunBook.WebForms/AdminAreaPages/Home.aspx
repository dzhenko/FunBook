<%@ Page Title="" Language="C#" MasterPageFile="~/AdminAreaPages/AdminsMasterPage.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FunBook.WebForms.AdminAreaPages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderAdminArea" runat="server">
    <div class="pink jumbotron">
        <h1>Welcome to the admin panel</h1>
        <br />
        <h2>Here you can edit jokes and users</h2>
        <hr />
        <a href="ManageItems.aspx" class="btn btn-lg btn-info">Jokes</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ManageUsers.aspx" class="btn btn-lg btn-info">Users</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="../FunAreaPages/Home.aspx" class="btn btn-lg btn-info">Home</a>
    </div>    
</asp:Content>
