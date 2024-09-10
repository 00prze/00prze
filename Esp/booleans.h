#ifndef boolEANS_H
#define boolEANS_H
bool isAimKnocked = true;
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}
kaddr module= (unsigned long)_dyld_get_image_vmaddr_slide(0);
  bool line_trace_single(UObject* obj, FVector start, FVector end)
{
    FHitResult out_hit;
    
    auto actors_to_ignore = TArray<UObject*>();

    return ((bool (*)(UObject*, FVector, FVector, uint8_t, bool, TArray<UObject*>&, uint8_t, FHitResult&, bool, FLinearColor, FLinearColor, float))
    (module + 0x105755634))(obj, start, end, 8, false, actors_to_ignore, 0, out_hit, false, {}, {}, 0.0f);
}

//hook no jb


static auto start = std::chrono::steady_clock::now();
static auto noww = std::chrono::high_resolution_clock::now();
auto elapsedd = std::chrono::duration_cast<std::chrono::milliseconds>(noww - start).count();
namespace Settings
{
    static int Tab = 0;
}
uintptr_t UE4;

namespace Options
{
int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 500;
}

enum EAimTarget {
    Head = 0,
    Chest = 1,
};

enum EAimTrigger {
    None = 0,
    Shooting = 1,
    Scoping = 2,
    Both = 3,
    Any = 4
};


long l1 = 0xFF544;
long l2 = 0xFFFFF;
//const char * stack230 = 0;//index of class array 75
int stack_20;
NSString * val_1;
NSString * val_x2 ;
int sort = 1,sort_1 = 3;
long RAMADDRESS = 0x4332443;//0x4332443 + F = 0x4332452
bool stack_193 = NO;
using namespace std;
using namespace SDK;
int enemycount6;
static int Styleesp = 2;
bool EspLine;
bool EspSkeleton;
bool EspHealth;
bool ConfigSilentAimEnable = false;
    struct sConfig {
        struct sESPMenu {
            bool Line;
            bool Box;
            bool Skeleton;
            bool Health;
            bool Name;
            bool Distance;
            bool TeamID;
            bool Weapon;
            bool Alert;
            bool Vehicle;
            bool IgnoreBot;
            bool LootBox;
            bool Throwables;
        };
        sESPMenu ESPMenu{false};

        
    };
    sConfig Config{false};
//

UISlider * Auto1;//autofire
UISlider * Auto1Interval;//autofire interval
UISlider * sliderrr;//aimpos
extern float TurnRate; //No scope turn rate - aim speed
extern float NoScopeAimDisSliderVal;
extern float HiddenFOVSliderVal;// with scope Filed of view slider value /NOT ACTIVE/
extern float NoScopeFOVSliderVal;//No scope FOV size slider value
//Slider_Sniper * Aimbot1;//fov
//extern float FovRadousVal;
UISlider * aimspeed;//aimbot speed
CGSize AutoFireCircelSize;// CGSizeMake(w, h);
bool IsAirDrop = false;
int Interval = 1;
int counter;
int iAwareTexSiz = 20;
bool iAwareText = true;
int EspTextSiz = 9;
float EspBoxThik = 2.0f;
float EspSktonThik = 1.5f;
float IsfovSlider = 150.0f;
float AimSmooth = 5.0f;
bool AimTouch = false;
bool antibypass = false;
//UISlider * Aimbot2;
//aimbot bool


int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 150;

uintptr_t ProcessEvent_Offset,AimBullet_Offset,AimBullet_Offset2,SetControlRotation_Offset;
#define SLEEP_TIME 1000LL / 60LL
#define TORAD(x) ((x) * (M_PI / 180.f))
int g_screenWidth ;
int g_screenHeight ;
int screenWidth ;
int screenHeight ;
int screenDensity = 0;
int getEspFramerate;
int SCOLOR;
int scc;


char extra[30];
float density = -1;
float gDistance;
int localFiring{0};
BOOL kaiguan1 = NO;
BOOL kaiguan2 = NO;
BOOL kaiguan3 = NO;
BOOL kaiguan4 = NO;
#define PI 3.14159265358979323846
#define __fastcall
bool ARWP = false;
bool SMGWP =false;
bool SNPWP = false;
bool otherWP =false;
bool AmmoWP =false;
bool LIGHTMW = false;
bool SHOTGUNWP = false;
bool scopewp = false;
bool POSTOLWP = false;
bool ARMORWP =false;
//extern float FovRadousVal;
float IsAimBotRecc = 1.183f;
bool IsRecoilComparison = false;
static int Istargets = 2;

static int loaixe = 0;
static int xedacia = 0;
bool modxe = false;
bool tamnho = false;

//hiệu ứng bắn
bool effectm44 = false;

float dorong = 88.0f;

float IsDistance = 68;
/*
float add() // circle radius size
{
   // if(FovRadousVal==0){
    float FovRadousVal = 230;
    
    return FovRadousVal;
}
*/

float aimspeedsl()
{
    // return aimspeed.value;
    float val1 = 20;//50
    //return TurnRate;// aim speed from slider
    return val1;
}
int aimpos()
{
    float speedVal = 25;//100
    //return sliderrr.value;//maybe speed
    return speedVal;
}
int autodiss()
{
    return Auto1.value;
}

#endif //boolEANS_H
