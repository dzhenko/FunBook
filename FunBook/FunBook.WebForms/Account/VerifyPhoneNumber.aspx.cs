﻿using System;
using System.Linq;
using System.Web;
using FunBook.WebForms.Providers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace FunBook.WebForms.Account
{
    public partial class VerifyPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<UserManager>();
            var phonenumber = Request.QueryString["PhoneNumber"];
            var code = manager.GenerateChangePhoneNumberToken(User.Identity.GetUserId(), phonenumber);           
            PhoneNumber.Value = phonenumber;
        }

        protected void Code_Click(object sender, EventArgs e)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Invalid code");
                return;
            }

            var manager = Context.GetOwinContext().GetUserManager<UserManager>();

            var result = manager.ChangePhoneNumber(User.Identity.GetUserId(), PhoneNumber.Value, Code.Text);

            if (result.Succeeded)
            {
                var user = manager.FindById(User.Identity.GetUserId());

                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, false);
                    Response.Redirect("/Account/Manage?m=AddPhoneNumberSuccess");
                }
            }

            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "Failed to verify phone");
        }
    }
}