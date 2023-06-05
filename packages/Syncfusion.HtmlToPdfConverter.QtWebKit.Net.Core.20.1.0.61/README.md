### Syncfusion .NET HTML to PDF converter

The Syncfusion [HTML to PDF converter](https://www.syncfusion.com/pdf-framework/net/html-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) is a .NET Core library that converts URLs, HTML string, SVG, MHTML to PDF in .NET Core application. This converter uses the advanced WebKit rendering engine, thus generating pixel-perfect PDF from HTML or URL.

> #### Starting with v20.1.0.x, if you reference Syncfusion HTML converter assemblies from trial setup or from the NuGet feed, include a license key in your projects. Refer to link to learn about generating and registering Syncfusion license key in your application to use the components without trail message.

![NET HTML to PDF converter](https://cdn.syncfusion.com/nuget-readme/fileformats/net-html-to-pdf.png)
[Features overview](https://www.syncfusion.com/pdf-framework/net/html-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | [Documentation](https://help.syncfusion.com/file-formats/pdf/converting-html-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | [API Reference](https://help.syncfusion.com/cr/file-formats/Syncfusion.Pdf.HtmlToPdf.html?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | [Online Demo](https://ej2.syncfusion.com/aspnetcore/PDF/HtmltoPDF#/bootstrap5) | [Blogs](https://www.syncfusion.com/blogs/?s=html+to+pdf) | [Support](https://support.syncfusion.com/support/tickets/create?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | [Forums](https://www.syncfusion.com/forums?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | [Feedback](https://www.syncfusion.com/feedback/wpf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)

### Key Features

* Converts any [webpage to PDF.](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#url-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)
* Converts any raw [HTML string to PDF.](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#html-string-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)
* Prevents text and image split across pages.
* Converts [HTML form to fillable PDF form](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#html-form-to-pdf-form?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).
* Works both in 32-bit and 64-bit environments.
* Automatically [creates Table of Contents](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#table-of-contents?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).
* Automatically creates [bookmark hierarchy](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#bookmarks?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).
* Converts only a [part of the web page to PDF](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#partial-webpage-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).
* Supports header and footer.
* Repeats HTML table header and footer in PDF.
* Supports HTML5, CSS3, SVG, and Web fonts.
* Converts any HTML to SVG.
* Supports accessing HTML page using both [HTTP POST and GET](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#http-get-and-post?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) methods.
* Supports HTTP cookies.
* Supports cookies-based [form authentication](https://help.syncfusion.com/file-formats/pdf/convert-html-to-pdf/webkit#form-authentication?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).
* Thread safe.
* Supports internal and external hyperlinks.
* Sets document properties, page settings, security, viewer preferences, etc.
* Protects PDF document with password and permission.

### System Requirements

* [System Requirements](https://help.syncfusion.com/file-formats/installation-and-upgrade/system-requirements?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget).

### Getting Started

Install the [Syncfusion.HtmlToPdfConverter.QtWebKit.Net.Core](https://www.nuget.org/packages/Syncfusion.HtmlToPdfConverter.QtWebKit.Net.Core?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) NuGet package as reference to your .NET Core application from [NuGet.org](https://www.nuget.org/).

### Convert HTML to PDF document programmatically using C#

```csharp
//Initialize HTML to PDF converter.
HtmlToPdfConverter htmlConverter = new HtmlToPdfConverter();
WebKitConverterSettings webkitConverterSettings = new WebKitConverterSettings();
//Assign Webkit converter settings to HTML converter
htmlConverter.ConverterSettings = webkitConverterSettings;
//Convert URL to PDF
PdfDocument document = htmlConverter.Convert("https://www.syncfusion.com");
FileStream fileStream = new FileStream("Sample.pdf", FileMode.CreateNew, FileAccess.ReadWrite);
//Save and close the PDF document 
document.Save(fileStream);
document.Close(true);
```

### License

This NuGet package includes code from the QtWebKit Project. This code is subject to the terms of the QtWebKit Project license available [here](https://doc.qt.io/archives/qt-5.5/licenses.html#webkit-used-by-the-qtwebkit-module). Syncfusion does not provide any warranty or any indemnity with regard to the use of code from the QtWebKit Project. If you do not agree to these terms, please do not install, or use this NuGet package.

### About Syncfusion

Founded in 2001 and headquartered in Research Triangle Park, N.C., Syncfusion has more than 27,000+ customers and more than 1 million users, including large financial institutions, Fortune 500 companies, and global IT consultancies.
 
Today, we provide 1700+ components and frameworks for web ([Blazor](https://www.syncfusion.com/blazor-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [ASP.NET Core](https://www.syncfusion.com/aspnet-core-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [ASP.NET MVC](https://www.syncfusion.com/aspnet-mvc-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [ASP.NET Web Forms](https://www.syncfusion.com/jquery/aspnet-webforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Angular](https://www.syncfusion.com/angular-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [React](https://www.syncfusion.com/react-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Vue](https://www.syncfusion.com/vue-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), and [jQuery](https://www.syncfusion.com/jquery-ui-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)), mobile ([.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), and [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)), and desktop development ([WinForms](https://www.syncfusion.com/winforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [WPF](https://www.syncfusion.com/wpf-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [WinUI](https://www.syncfusion.com/winui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget), and [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget)). We provide ready-to-deploy enterprise software for dashboards, reports, data integration, and big data processing. Many customers have saved millions in licensing fees by deploying our software.

[sales@syncfusion.com](mailto:sales@syncfusion.com?Subject=Syncfusion%20HTMLConverter%20-%20NuGet) | [www.syncfusion.com](https://www.syncfusion.com?utm_source=nuget&utm_medium=listing&utm_campaign=aspnetcore-htmltopdfconverter-nuget) | Toll Free: 1-888-9 DOTNET

