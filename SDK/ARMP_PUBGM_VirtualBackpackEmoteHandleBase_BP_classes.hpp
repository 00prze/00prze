#pragma once

// GLOBAL BABAJI (3.3.0) 
//SDK GENERATED BY @mariopc2

namespace SDK
{
//---------------------By ARMP---------------------------
//Classes
//---------------------By ARMP---------------------------

// BlueprintGeneratedClass VirtualBackpackEmoteHandleBase_BP.VirtualBackpackEmoteHandleBase_BP_C
// 0x0000 (0x01E8 - 0x01E8)
class UVirtualBackpackEmoteHandleBase_BP_C : public UBackpackEmoteHandle
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("BlueprintGeneratedClass VirtualBackpackEmoteHandleBase_BP.VirtualBackpackEmoteHandleBase_BP_C");
		return pStaticClass;
	}


	struct FBattleItemData ExtractItemData();
	bool HandleDisuse(EBattleItemDisuseReason* Reason);
	bool HandleUse(struct FBattleItemUseTarget* Target, EBattleItemUseReason* Reason);
	bool HandlePickup(struct FBattleItemPickupInfo* PickupInfo, EBattleItemPickupReason* Reason, TScriptInterface<class UItemContainerInterface>* ItemContainer);
};


}

