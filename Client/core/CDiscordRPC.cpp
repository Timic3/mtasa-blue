#include "StdInc.h"
#include "CDiscordRPC.h"

CDiscordRPC::CDiscordRPC()
{
}

CDiscordRPC::~CDiscordRPC()
{
    Shutdown();
}

void CDiscordRPC::Initialize()
{
    if (bInitialized)
        return;

    handlers = {};

    Discord_Initialize("430081389862322178", &handlers, 1, nullptr);

    bInitialized = true;
}

void CDiscordRPC::Shutdown()
{
    if (bInitialized)
    {
        Discord_Shutdown();

        bInitialized = false;
    }
}
