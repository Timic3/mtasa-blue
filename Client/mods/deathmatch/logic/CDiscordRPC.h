#pragma once

#include <discord_rpc.h>

class CDiscordRPC
{
public:
	CDiscordRPC();
	~CDiscordRPC();

    bool bInitialized;
    DiscordEventHandlers handlers;

    void Initialize();
    void Shutdown();
};
