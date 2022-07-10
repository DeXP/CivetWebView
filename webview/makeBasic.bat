cl examples/basic.cc /std:c++17 /EHsc /Fobuild\ ^
    /I libs\webview ^
    /I libs\webview2\build\native\include ^
    libs\webview2\build\native\x64\WebView2LoaderStatic.lib ^
    /link advapi32.lib /OUT:build\basic.exe