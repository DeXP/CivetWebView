// CivertWebView.cpp : Defines the entry point for the application.
//

#include "webview.h"
#include "CivetServer.h"

#include "CivetWebView.h"

#include <cstring>


#define DOCUMENT_ROOT "."
#define PORT "38080"


#ifdef WIN32
int WINAPI WinMain(HINSTANCE hInt, HINSTANCE hPrevInst, LPSTR lpCmdLine,
    int nCmdShow) {
#else
int main() {
#endif
    mg_init_library(0);

    const char* options[] = {
        "document_root", DOCUMENT_ROOT,
        "listening_ports", PORT,
        "cgi_interpreter", "cgi-bin/ph7-cgi",
        0 };

    std::vector<std::string> cpp_options;
    for (int i = 0; i < (sizeof(options) / sizeof(options[0]) - 1); i++) {
        cpp_options.push_back(options[i]);
    }

    CivetServer server(cpp_options); // <-- C++ style start


    webview::webview w(false, nullptr);
    w.set_title(CIVETWEBVIEW_APP_NAME);
    w.set_size(800, 600, WEBVIEW_HINT_NONE);

#ifdef WIN32
    //SendMessage((HWND)w.window(), WM_SYSCOMMAND, SC_MAXIMIZE, 0);
#endif //  WIN32


    w.navigate("http://127.0.0.1:38080");
    w.run();

    mg_exit_library();

    return 0;
}
