<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="PictureEdit.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms.PictureEdit" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <fieldset class="blue">
        <legend class="blue">Picture</legend>
        <div class="form-group">
            <label for="inputTitlePicture" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="inputTitlePicture" placeholder="Title" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="inputTitlePicture" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="checkbox">
            <label>
                <input id="isAnonymous" runat="server" type="checkbox">
                Anonymous
            </label>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <a href="/" class="btn btn-default" runat="server">Cancel</a>
                <asp:LinkButton Text="Submit" runat="server" class="btn btn-primary" OnClick="pictureEdit_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>
