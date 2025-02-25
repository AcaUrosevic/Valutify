#include "app.h"

wxIMPLEMENT_APP(MyApp);

bool MyApp::OnInit() {
    wxFrame *frame = new wxFrame(nullptr, wxID_ANY, "Hello wxWidgets! Running on " PLATFORM_NAME, 
                                 wxDefaultPosition, wxSize(400, 300));
    frame->Show(true);
    return true;
}
