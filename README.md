# CivetWebView

[CivetWebView](https://github.com/DeXP/CivetWebView) is my attempt to have a functionality of both [CivetWeb](https://github.com/civetweb/civetweb) and [WebView](https://github.com/webview/webview) in a single application.

Any run- or compile-time requirements are set in [WebView](https://github.com/webview/webview). Users will need to install [WebView2 runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) for Windows. And GTK3/LibWebKit2GTK on Linux. etc.


## Windows compilation

1. Download [Visual Studio](https://visualstudio.microsoft.com/) (I used 2022, Community edition). 
2. Double click `CivetWebView.sln`
3. Build/Run

The [Microsoft's WebView2](https://www.nuget.org/packages/Microsoft.Web.WebView2) library is statically linked with the application by default. So you'll have a stand alone executable without requirements of non-system components, i.e. no DLLs should be nearby. But [runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) installation still will be required for each user. Except Windows 11 or higher - runtime is already there.

## Linux/other compilation

`make`

I suggest to redistribute via source form since linking with a lot of libraries used. It's because of GTK3 and LibWebKit2GTK.


## Credits

Dmitry Hrabrov a.k.a. DeXPeriX: https://dexp.in