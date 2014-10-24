<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="JokeEdit.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms.JokeEdit" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="form-horizontal">
        <fieldset class="blue">
            <legend class="blue">Edit Joke</legend>
            <div class="form-group">
                <label for="inputTitleJoke" class="col-lg-2 control-label">Title</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputTitleJoke" runat="server">
                    <asp:RequiredFieldValidator ControlToValidate="inputTitleJoke" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label for="jokeText" class="col-lg-2 control-label">Textarea</label>
                <div class="col-lg-10">
                    <textarea class="form-control" rows="3" id="jokeText" runat="server"></textarea>
                    <asp:RequiredFieldValidator ControlToValidate="jokeText" Display="Dynamic" runat="server" 
                        ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
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
                    <a  href="/" class="btn btn-default" runat="server">Cancel</a>
                    <asp:LinkButton Text="Submit" runat="server" class="btn btn-primary" OnClick="jokeEdit_Click" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
