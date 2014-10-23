<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="PictureEdit.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms.PictureEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <fieldset>
        <legend>Picture</legend>
        <div class="form-group">
            <label for="inputTitlePicture" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="inputTitlePicture" placeholder="Title" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="inputTitlePicture" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="urlPic" class="col-lg-2 control-label">Url path</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="urlPic" runat="server" />
                <asp:RequiredFieldValidator ControlToValidate="urlPic" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                <div class="checkbox">
                    <label>
                        <input id="isAnonymous" runat="server" type="checkbox">
                        Anonymous
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <button class="btn btn-default" runat="server">Cancel</button>
                <asp:LinkButton Text="Submit" runat="server" class="btn btn-primary" OnClick="pictureEdit_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>
