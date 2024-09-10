export THEOS=/home/prze/theos
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = przeware

$(TWEAK_NAME)_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

$(TWEAK_NAME)_CCFLAGS = -w -std=gnu++14 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c
$(TWEAK_NAME)_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value


#$(TWEAK_NAME)_OBJ_FILES = 5Toubun/libdobby.a

$(TWEAK_NAME)_FILES = ImGuiDrawView.mm Esp/Tools.cpp Esp/Memory.cpp $(wildcard Esp/custom/*.cpp) $(wildcard Esp/ui/*.cpp)  $(wildcard Esp/*.mm) $(wildcard Esp/*.m) $(wildcard IMGUI/*.cpp) $(wildcard IMGUI/*.mm) $(wildcard SDK/ARMP_PUBGM_Engine_functions.cpp) $(wildcard SDK/ARMP_PUBGM_CoreUObject_functions.cpp) $(wildcard SDK/ARMP_PUBGM_ShadowTrackerExtra_functions.cpp) $(wildcard SDK/ARMP_PUBGM_Basic.cpp) $(wildcard SDK/ARMP_PUBGM_Gameplay_functions.cpp)
#  


 GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk


