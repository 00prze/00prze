#pragma once

// GLOBAL BABAJI (3.3.0) 
//SDK GENERATED BY @mariopc2

namespace SDK
{
//---------------------By ARMP---------------------------
//Classes
//---------------------By ARMP---------------------------

// Class QRCodeUtility.ZXingScanner
// 0x0000 (0x0028 - 0x0028)
class UZXingScanner : public UBlueprintFunctionLibrary
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class QRCodeUtility.ZXingScanner");
		return pStaticClass;
	}


	static class UTexture2D* Encode(const struct FString& Text);
	static bool Decode(class UTexture2D* Texture, const struct FVector4& InRect, struct FZXingScanResult* OutResult);
};


}

