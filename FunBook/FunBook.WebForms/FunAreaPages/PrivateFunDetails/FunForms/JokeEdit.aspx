<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="JokeEdit.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms.JokeEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="form-horizontal">
        <fieldset>
            <legend>Edit Joke</legend>
            <div class="form-group">
                <label for="inputTitleJoke" class="col-lg-2 control-label">Title</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputTitleJoke" runat="server">
                </div>
            </div>
            <div class="form-group">
                <label for="jokeText" class="col-lg-2 control-label">Textarea</label>
                <div class="col-lg-10">
                    <textarea class="form-control" rows="3" id="jokeText" runat="server"></textarea>
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
                    <asp:LinkButton Text="Submit" runat="server" class="btn btn-primary" OnClick="jokeEdit_Click" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
