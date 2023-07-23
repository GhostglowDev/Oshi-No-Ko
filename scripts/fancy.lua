local ffi = require("ffi");
local user32 = ffi.load("user32");
local username = os.getenv("USERNAME");

ffi.cdef([[
enum{

    MB_OK = 0x00000000L,

    MB_OKCANCEL = 0x00000001L,

    MB_ABORTRETRYIGNORE = 0x00000002L,

    MB_YESNOCANCEL = 0x00000003L,

    MB_YESNO = 0x00000004L,

    MB_RETRYCANCEL = 0x00000005L,

    MB_CANCELTRYCONTINUE = 0x00000006L,

    MB_HELP = 0x00004000L,

    MB_ICONWARNING = 0x00000030L,

    MB_ICONCONFIRMATION = 0x00000040L

};
typedef void* HANDLE;

typedef HANDLE HWND;

typedef const char* LPCSTR;

typedef unsigned UINT;


int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);

int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]]);

function onCreatePost()
    windowTitle("Friday Night Funkin: Psych Engine - Currently Playing: "..songName)
end

function onDestroy()
    windowTitle("Friday Night Funkin: Psych Engine")
end

function windowTitle(title)
    setPropertyFromClass('lime.app.Application', 'current.window.title', title);
end