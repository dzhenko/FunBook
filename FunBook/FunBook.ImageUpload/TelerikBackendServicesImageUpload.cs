namespace FunBook.ImageUpload
{
    using System;
    using System.IO;

    using Telerik.Everlive.Sdk.Core;
    using Telerik.Everlive.Sdk.Core.Query.Definition.FormData;

    public class TelerikBackendServicesImageUpload : IImageUploader
    {
        private const string EverliveAppKey = "yTpcS8cIlRXlVS2a";
        
        private EverliveApp app;

        public TelerikBackendServicesImageUpload()
        {
            app = new EverliveApp(EverliveAppKey);
        }

        public static string DefaultUrl
        {
            get
            {
                return "http://api.everlive.com/v1/yTpcS8cIlRXlVS2a/Files/730fbdc0-53f2-11e4-b2b7-0f2a33946566/Download";
            }
        }
        
        public string UrlFromBase64Image(string base64)
        {
            var stream = new MemoryStream(Convert.FromBase64String(base64));

            var uploadResult = app.WorkWith().Files().Upload(new FileField("fieldName", Guid.NewGuid().ToString(), "image/jpeg", stream)).ExecuteSync();

            var url = app.WorkWith().Files().GetFileDownloadUrl(uploadResult.Id);

            return url;
        }
    }
}
