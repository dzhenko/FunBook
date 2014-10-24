<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GeneralError.aspx.cs" Inherits="FunBook.WebForms.Errors.GeneralError" %>

<asp:Content ID="ContentError" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron pink text-center">
        <h1>Excuse us for this mishap ... and try again in a bit</h1>

        <p><a href="/" class="btn btn-primary btn-lg">Go Back Home</a></p>

        <img src="../Content/Images/error.jpg" alt="error"/>
    </div>
</asp:Content>
