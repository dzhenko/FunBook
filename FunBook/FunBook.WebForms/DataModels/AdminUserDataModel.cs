namespace FunBook.WebForms.DataModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;
    using FunBook.Models;

    public class AdminUserDataModel
    {
        public static Expression<Func<User, AdminUserDataModel>> FromUser
        {
            get
            {
                return u => new AdminUserDataModel()
                {
                    Id = u.Id,
                    Email= u.Email,
                    IsAdmin = u.Roles.Count > 0
                };
            }
        }

        public string Id { get; set; }

        public string Email { get; set; }

        public bool IsAdmin { get; set; }
    }
}