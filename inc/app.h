#ifndef APP_H
#define APP_H

#include <wx/wx.h>

#ifdef _WIN32
    #define PLATFORM_NAME "Windows"
#elif defined(__linux__)
    #define PLATFORM_NAME "Linux"
#else
    #define PLATFORM_NAME "Unknown OS"
#endif

class MyApp : public wxApp {
public:
    virtual bool OnInit();
};

#endif