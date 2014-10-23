﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="LinkEdit.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms.LinkEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <fieldset>
        <legend>Link Eddit</legend>
        <div class="form-group">
            <label for="inputTitleLink" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="inputTitleLink" placeholder="Title" runat="server">
            </div>
        </div>
        <div class="form-group">
            <label for="urlLink" class="col-lg-2 control-label">Url</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" runat="server" id="urlLink" />
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
                <asp:LinkButton Text="Submit" runat="server" class="btn btn-primary" OnClick="linkEdit_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>