#pragma once

// GLOBAL BABAJI (3.3.0) 
//SDK GENERATED BY @mariopc2

namespace SDK
{
//---------------------By ARMP---------------------------
//Classes
//---------------------By ARMP---------------------------

// Class ShaderCore.PrecompileShaderGameConfig
// 0x0048 (0x0070 - 0x0028)
class UPrecompileShaderGameConfig : public UObject
{
public:
	TArray<struct FCollectSwitchs>                     CollectSwitchs;                                           // 0x0028(0x0010) (ZeroConstructor, Config)
	TArray<struct FDeviceRenderConfig>                 DeviceRenderConfigs;                                      // 0x0038(0x0010) (ZeroConstructor, Config)
	TArray<struct FMapRenderConfig>                    MapRenderConfigs;                                         // 0x0048(0x0010) (ZeroConstructor, Config)
	unsigned char                                      UnknownData00[0x18];                                      // 0x0058(0x0018) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class ShaderCore.PrecompileShaderGameConfig");
		return pStaticClass;
	}

};


// Class ShaderCore.ShaderGroupSettings
// 0x0058 (0x0080 - 0x0028)
class UShaderGroupSettings : public UObject
{
public:
	TArray<struct FShaderLevel>                        Levels_IOS;                                               // 0x0028(0x0010) (ZeroConstructor, Config)
	TArray<struct FShaderLevel>                        Levels_AOS;                                               // 0x0038(0x0010) (ZeroConstructor, Config)
	TArray<struct FShaderPak>                          Paks_IOS;                                                 // 0x0048(0x0010) (ZeroConstructor, Config)
	TArray<struct FShaderPak>                          Paks_AOS;                                                 // 0x0058(0x0010) (ZeroConstructor, Config)
	unsigned char                                      UnknownData00[0x18];                                      // 0x0068(0x0018) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class ShaderCore.ShaderGroupSettings");
		return pStaticClass;
	}

};


}

