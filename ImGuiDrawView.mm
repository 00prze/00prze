//frameworks
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

//imgui
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"

//menu
#include "Esp/ui/ui.hpp"

//5Toubun
#import "5Toubun/NakanoIchika.h"
#import "5Toubun/NakanoNino.h"
#import "5Toubun/NakanoMiku.h"
#import "5Toubun/NakanoYotsuba.h"
#import "5Toubun/NakanoItsuki.h"
#import "5Toubun/dobby.h"

//basics
#include "sys/mman.h"
#include <string>
#include <algorithm>
#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>

//etc
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#include "Esp/Tools.h"
#include "Esp/Vector3.hpp"
#include "Esp/Vector2.hpp"
#import "Esp/UE4.h"
#include "Esp/Tools.h"


//definitions
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale
#define patch_NULL(a, b) vm(ENCRYPTOFFSET(a), strtoul(ENCRYPTHEX(b), nullptr, 0))
#define patch(a, b) vm_unity(ENCRYPTOFFSET(a), strtoul(ENCRYPTHEX(b), nullptr, 0))
#define E(str) _xor_(str).c_str()
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
#define iPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define gName 0x1043c2eec
#define gObject 0x109652F28


uint64_t GUObjectArray;
uint64_t GNameFun;

@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@end
#include "Esp/booleans.h"
@implementation ImGuiDrawView


void DrawLineWithImGui(ImDrawList* draw_list, const FVector2D& start, const FVector2D& end, float thickness, ImColor color) {
    draw_list->AddLine(ImVec2(start.X, start.Y), ImVec2(end.X, end.Y), color, thickness);
}
//Function for hacking/cheating is now up here. Example auto update right here (work on every version of this game)
void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight);

 FVector2D startPosition;
 FVector2D endPosition;

#include "PidorDeal.h"


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

    ui::init();
    
    
    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)showChange:(BOOL)open
{
    MenDeal = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{
  *(uint32_t *)(module + 0x108DD4340) = 0; 

   CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view
{
   
    
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.scale ?: UIScreen.mainScreen.scale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 120);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    

//Define your bool/function in here

        
        if (MenDeal == true) {
            [self.view setUserInteractionEnabled:YES];
        } else if (MenDeal == false) {
            [self.view setUserInteractionEnabled:NO];
        }

        MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
        if (renderPassDescriptor != nil)
        {
            id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
            [renderEncoder pushDebugGroup:@"ImGui Jane"];

            ImGui_ImplMetal_NewFrame(renderPassDescriptor);
            ImGui::NewFrame();
           
            
            CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 360) / 2;
            CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 300) / 2;
            
            // ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
            // ImGui::SetNextWindowSize(ImVec2(400, 300), ImGuiCond_FirstUseEver);
            


//#define AUTH









//This function is a patch example function, doesn't work on this menu because I didn't add the button into menu UI
            // if(show_s1){
            //     if(show_s1_active == NO){
            //         patch("0x517A154", "0x360080D2");
            //         patch_NULL("0x10517A154", "0x360080D2");
            //         }
            //     show_s1_active = YES;
            // }
            // else{
            //     if(show_s1_active == YES){
            //         patch("0x517A154", "0xF60302AA");
            //         patch_NULL("0x10517A154", "0xF60302AA");
            //         }
            //     show_s1_active = NO;
            // }




        void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight);
        

        ui::draw();
        ui::watermark();

            ImGui::Render();
            ImDrawData* draw_data = ImGui::GetDrawData();
            ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
          
            [renderEncoder popDebugGroup];
            [renderEncoder endEncoding];

            [commandBuffer presentDrawable:view.currentDrawable];
        }

        [commandBuffer commit];
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}
typedef uintptr_t kaddr;
using namespace std;
using namespace SDK;

string encryptDecrypt(string toEncrypt) {
    char key[3] = {'K', 'C', 'Q'}; 
    string output = toEncrypt;
    for (int i = 0; i < toEncrypt.size(); i++)
        output[i] = toEncrypt[i] ^ key[i % (sizeof(key) / sizeof(char))];
    return output;
}

kaddr getRealOffset(kaddr offset){
    return (unsigned long)_dyld_get_image_vmaddr_slide(0)+offset;
}
long obbbbl() {
    return getRealOffset((kaddr)gObject);
}

UWorld *GEWorld;
int GWorldNum = 0;
TUObjectArray gobjects;

UWorld *GetFullWorld() {
    if (GWorldNum == 0) {
        gobjects = UObject::GUObjectArray->ObjObjects;
        for (int i = 0; i < gobjects.Num(); i++) {
            if (auto obj = gobjects.GetByIndex(i)) {
                if (obj->IsA(UEngine::StaticClass())) {
                    auto GEngine = (UEngine *) obj;
                    if (GEngine) {
                        tslFont = GEngine->MediumFont;
                        robotoTinyFont = GEngine->MediumFont;
                        robotoFont = GEngine->MediumFont;
                        auto ViewPort = GEngine->GameViewport;
                        if (ViewPort) {
                            GEWorld = ViewPort->World;
                            GWorldNum = i;
                            return ViewPort->World;
                        }
                    }
                }
            }
        }
    } else {
        auto GEngine = (UEngine *) (gobjects.GetByIndex(GWorldNum));
        if (GEngine) {
            tslFont = GEngine->MediumFont;
            robotoTinyFont = GEngine->MediumFont;
            robotoFont = GEngine->MediumFont;
            auto ViewPort = GEngine->GameViewport;
            if (ViewPort) {
                GEWorld = ViewPort->World;
                return ViewPort->World;
            }
        }
    }
    return 0;
}

TNameEntryArray *GetGNames() {
    return ((TNameEntryArray * (*)())((unsigned long)_dyld_get_image_vmaddr_slide(0) + gName))();
}

std::vector<AActor *> getActors() {
    auto World = GetFullWorld();
    if (!World)
        return std::vector<AActor *>();

    auto PersistentLevel = World->PersistentLevel;
    if (!PersistentLevel)
        return std::vector<AActor *>();

    auto Actors = *(TArray<AActor *> *)((uintptr_t) PersistentLevel + 0xa0);

    std::vector<AActor *> actors;
    for (int i = 0; i < Actors.Num(); i++) {
        auto Actor = Actors[i];
        if (Actor) {
            actors.push_back(Actor);
        }
    }
    return actors;
}

template <class T>
void GetAllActors(std::vector<T*>& Actors) {
    UGameplayStatics* gGameplayStatics = (UGameplayStatics*)gGameplayStatics->StaticClass();
    auto GWorld = GetFullWorld();
    if (GWorld) {
        TArray<AActor*> Actors2;
        gGameplayStatics->GetAllActorsOfClass((UObject*)GWorld, T::StaticClass(), &Actors2);
        for (int i = 0; i < Actors2.Num(); i++) {
            Actors.push_back((T*)Actors2[i]);
        }
    }
//     if (g_Memory.Blacksky) {             
// if (Object->IsA(ASTExtraShootWeapon::StaticClass())) {
// auto playerChar = (ASTExtraShootWeapon *) Object;
// playerChar->CurShootType = ESTEWeaponShootType::ESTEWeaponShootType__ESTEWeaponShootType_MAX;
// playerChar->voiceCheckDis = 0;
// }}
}

FVector GetBoneLocationByName(ASTExtraPlayerCharacter *Actor, const char *BoneName) {
    return Actor->GetBonePos(BoneName, FVector());
}


struct sRegion {
    kaddr start, end;
};

std::vector<sRegion> trapRegions;

bool isObjectInvalid(UObject *obj) {
    if (!Tools::IsPtrValid(obj)) {
        return true;
    }
    if (!Tools::IsPtrValid(obj->ClassPrivate)) {
        return true;
    }
    if (obj->InternalIndex <= 0) {
        return true;
    }
    if (obj->NamePrivate.ComparisonIndex <= 0) {
        return true;
    }
    if ((kaddr)(obj) % sizeof(kaddr) != 0x0 && (kaddr)(obj) % sizeof(kaddr) != 0x4) {
        return true;
    }
    if (std::any_of(trapRegions.begin(), trapRegions.end(), [&](const sRegion& region) {
        return ((kaddr)obj) >= region.start && ((kaddr)obj) <= region.end;
    }) || std::any_of(trapRegions.begin(), trapRegions.end(), [&](const sRegion& region) {
        return ((kaddr)obj->ClassPrivate) >= region.start && ((kaddr)obj->ClassPrivate) <= region.end;
    })) {
        return true;
    }
    return false;
}

bool WriteAddr(void *addr, void *buffer, size_t length) {
    unsigned long page_size = sysconf(_SC_PAGESIZE);
    unsigned long size = page_size * sizeof(kaddr);
    return mprotect((void *) ((kaddr) addr - ((kaddr) addr % page_size) - page_size), (size_t) size, PROT_EXEC | PROT_READ | PROT_WRITE) == 0 && memcpy(addr, buffer, length) != 0;
}

template<typename T>
void Write(kaddr addr, T value) {
    WriteAddr((void *) addr, &value, sizeof(T));
}

class Rect2 {
public:
    float x;
    float y;
    float width;
    float height;

    Rect2() {
        this->x = 0;
        this->y = 0;
        this->width = 0;
        this->height = 0;
    }

    Rect2(float x, float y, float width, float height) {
        this->x = x;
        this->y = y;
        this->width = width;
        this->height = height;
    }

    bool operator==(const Rect2 &src) const {
        return (src.x == this->x && src.y == this->y && src.height == this->height &&
                src.width == this->width);
    }

    bool operator!=(const Rect2 &src) const {
        return (src.x != this->x && src.y != this->y && src.height != this->height &&
                src.width != this->width);
    }
};
FLinearColor get_rainbow_color(float deltaTime)
{
    static float time = 0.05f;
    time += deltaTime;
    float r = sin(time + 0.0f) * 0.5f + 0.5f;
    float g = sin(time + 2.0f * M_PI / 3.0f) * 0.5f + 0.5f;
    float b = sin(time + 4.0f * M_PI / 3.0f) * 0.5f + 0.5f;
    return FLinearColor(r, g, b, 1.0f);
}
struct FLinearColor visCol;
ASTExtraPlayerCharacter *g_LocalPlayer;
ASTExtraPlayerController *g_PlayerController;
#define COLOR_BLACK FLinearColor(0, 0, 0, 1.f)
#define COLOR_WHITE FLinearColor(1.f, 1.f, 1.f, 1.f)
#define COLOR_RED   FLinearColor(1.f, 0, 0, 1.f)
#define COLOR_LIME  FLinearColor(0, 1.f, 0, 1.f)
#define COLOR_BLUE  FLinearColor(0, 0, 1.f, 1.f)
#define COLOR_PURPLE FLinearColor(1.f, 0, 1.f, 1.f)
#define COLOR_CAR   FLinearColor(1.f, 0.5f, 1.f, 1.f)
#define GREEN       FLinearColor(0 / 255.f, 153 / 255.f, 0 / 255.f, 1.f)
#define ABU         FLinearColor(0 / 255.f, 204 / 255.f, 204 / 255.f, 1.f)
#define COLOR_GREEN FLinearColor(0, 0.5f, 0, 1.f)
#define COLOR_PLAYER FLinearColor(1.000f, 0.620f, 0.150f, 1.000f)
#define COLOR_YELLOW FLinearColor(1.000f, 1.000f, 0.000f, 1.000f)

void DrawRectangle(AHUD *HUD, FVector2D Pos, float Width, float Height, float Thickness, FLinearColor Color) {
    // Рисуем четыре стороны прямоугольника
    HUD->DebugCanvas->K2_DrawLine(FVector2D(Pos.X, Pos.Y), FVector2D(Pos.X + Width, Pos.Y), Thickness, Color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(Pos.X, Pos.Y), FVector2D(Pos.X, Pos.Y + Height), Thickness, Color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(Pos.X + Width, Pos.Y), FVector2D(Pos.X + Width, Pos.Y + Height), Thickness, Color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(Pos.X, Pos.Y + Height), FVector2D(Pos.X + Width, Pos.Y + Height), Thickness, Color);
}

FVector2D WorldToRadar(float Yaw, FVector Origin, FVector LocalOrigin, float PosX, float PosY,
                       FVector Size, bool & outbuff)
{
    bool flag = false;
    double num = (double)Yaw;
    double num2 = num * 0.017453292519943295;
    float num3 = (float)std::cos(num2);
    float num4 = (float)std::sin(num2);
    float num5 = Origin.X - LocalOrigin.X;
    float num6 = Origin.Y - LocalOrigin.Y;
    FVector2D vector;
    vector.X = (num6 * num3 - num5 * num4) / 150.f;
    vector.Y = (num5 * num3 + num6 * num4) / 150.f;
    FVector2D vector2;
    vector2.X = vector.X + PosX + Size.X / 2.f;
    vector2.Y = -vector.Y + PosY + Size.Y / 2.f;
    bool flag2 = vector2.X > PosX + Size.X;
    if (flag2)
    {
        vector2.X = PosX + Size.X;
    }
    else
    {
        bool flag3 = vector2.X < PosX;
        if (flag3)
        {
            vector2.X = PosX;
        }
    }
    bool flag4 = vector2.Y > PosY + Size.Y;
    if (flag4)
    {
        vector2.Y = PosY + Size.Y;
    }
    else
    {
        bool flag5 = vector2.Y < PosY;
        if (flag5)
        {
            vector2.Y = PosY;
        }
    }
    bool flag6 = vector2.Y == PosY || vector2.X == PosX;
    if (flag6)
    {
        flag = true;
    }
    outbuff = flag;
    return vector2;
}


void VectorAnglesRadar(Vector3 & forward, FVector & angles) {
 if (forward.X == 0.f && forward.Y == 0.f) {
  angles.X = forward.Z > 0.f ? -90.f : 90.f;
  angles.Y = 0.f;
 } else {
  angles.X = RAD2DEG(atan2(-forward.Z, forward.Magnitude(forward)));
  angles.Y = RAD2DEG(atan2(forward.Y, forward.X));
 }
 angles.Z = 0.f;
}
FRotator ToRotator(FVector local, FVector target) {
    FVector rotation;
    rotation.X = local.X - target.X;
    rotation.Y = local.Y - target.Y;
    rotation.Z = local.Z - target.Z;

    FRotator newViewAngle = {0};

    float hyp = sqrt(rotation.X * rotation.X + rotation.Y * rotation.Y);

    newViewAngle.Pitch = -atan(rotation.Z / hyp) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Yaw = atan(rotation.Y / rotation.X) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Roll = (float) 0.f;

    if (rotation.X >= 0.f)
        newViewAngle.Yaw += 180.0f;

    return newViewAngle;
}
#define SMALL_NUMBER 1.e-8f

inline float Sqrt(float Value) {
    return sqrtf(Value);
}

inline float SafeSqrt(float Value) {
    return (Value > SMALL_NUMBER) ? Sqrt(Value) : 0.0f;
}


void DrawLine(AHUD *HUD, FVector2D posFrom, FVector2D posTo, float Thickness, FLinearColor Color) {
    HUD->DebugCanvas->K2_DrawLine(posFrom, posTo, Thickness, Color);
}

void DrawFilledRectangle(AHUD *HUD, FVector2D Pos, float Width, float Height, FLinearColor Color) {
    // Прямоугольник заполняется с помощью нескольких линий (или текстуры, если доступно)
    // Здесь используется много K2_DrawLine для имитации заполненного прямоугольника
    for (float y = Pos.Y; y < Pos.Y + Height; y += 1.0f) {
        HUD->DebugCanvas->K2_DrawLine(FVector2D(Pos.X, y), FVector2D(Pos.X + Width, y), 1.0f, Color);
    }
}

void DrawArrows(AHUD *HUD, std::array<FVector2D, 39> Loc, float Thickness, FLinearColor Color, float HeadSize) {
    for (int i = 10; i < 25; i++) {
        DrawLine(HUD, Loc.at(i), Loc.at(7), Thickness, Color);
    }
    for (int i = 26; i < 38; i++) {
        DrawLine(HUD, Loc.at(i), Loc.at(7), Thickness, Color);
        DrawLine(HUD, Loc.at(i), Loc.at(8), Thickness, Color);
        DrawLine(HUD, Loc.at(i), Loc.at(9), Thickness, Color);
    }

    DrawLine(HUD, Loc.at(0), Loc.at(1), Thickness, Color);
    DrawLine(HUD, Loc.at(1), Loc.at(2), Thickness, Color);
    DrawLine(HUD, Loc.at(2), Loc.at(6), Thickness, Color);
    DrawLine(HUD, Loc.at(6), Loc.at(5), Thickness, Color);
    DrawLine(HUD, Loc.at(5), Loc.at(4), Thickness, Color);
    DrawLine(HUD, Loc.at(4), Loc.at(3), Thickness, Color);
    DrawLine(HUD, Loc.at(3), Loc.at(0), Thickness, Color);

    DrawLine(HUD, Loc.at(7), Loc.at(8), Thickness, Color);
    DrawLine(HUD, Loc.at(7), Loc.at(9), Thickness, Color);
    DrawLine(HUD, Loc.at(8), Loc.at(9), Thickness, Color);

    FVector2D Center = Loc.at(7);
    FVector2D Direction1 = Loc.at(8) - Center;
    FVector2D Direction2 = Loc.at(9) - Center;

    float Length1 = SafeSqrt(Direction1.X * Direction1.X + Direction1.Y * Direction1.Y);
    float Length2 = SafeSqrt(Direction2.X * Direction2.X + Direction2.Y * Direction2.Y);

    if (Length1 > SMALL_NUMBER) {
        Direction1.X /= Length1;
        Direction1.Y /= Length1;
    }
    if (Length2 > SMALL_NUMBER) {
        Direction2.X /= Length2;
        Direction2.Y /= Length2;
    }

    FVector2D InnerPoint1 = Center + Direction1 * HeadSize;
    FVector2D InnerPoint2 = Center + Direction2 * HeadSize;

    DrawLine(HUD, Center, InnerPoint1, Thickness + 4, Color);
    DrawLine(HUD, Center, InnerPoint2, Thickness + 4, Color);
    DrawLine(HUD, InnerPoint1, InnerPoint2, Thickness, Color);
}

void drawVerticalHealthBar(AHUD *HUD, FVector2D screenPos, float height, float maxHealth, float currentHealth) {
    screenPos += FVector2D(8.0f, 0.0f);

    // Рисуем фон для здоровья
    HUD->DebugCanvas->K2_DrawBox(screenPos, FVector2D(5.0f, height + 2), 1.0f); // Толщина 1 для контура

    screenPos += FVector2D(1.0f, 1.0f);
    FLinearColor clr = FLinearColor(0.0f, 1.0f, 0.0f, 0.5f);

    float barHeight = (currentHealth / maxHealth) * height;

    if (currentHealth <= (maxHealth * 0.6)) {
        clr = FLinearColor(1.0f, 0.0f, 1.0f, 0.5f);
    }

    if (currentHealth < (maxHealth * 0.3)) {
        clr = FLinearColor(1.0f, 0.0f, 0.0f, 0.5f);
    }

    // Рисуем заполненный прямоугольник для здоровья
    HUD->DebugCanvas->K2_DrawBox(screenPos, FVector2D(3.0f, barHeight), 0.0f); // Толщина 0 для заполнения
}
void Box4Line(AHUD* HUD, float thicc, int x, int y, int w, int h, FLinearColor color) {
    int iw = w / 4;
    int ih = h / 4;

    // Определение цвета линии
    FLinearColor black = FLinearColor(0, 0, 0, 1);

    // Вызовы K2_DrawLine с правильными параметрами
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x - thicc, y - thicc), FVector2D(x + iw + thicc, y - thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw - thicc, y - thicc), FVector2D(x + w + thicc, y - thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x - thicc, y - thicc), FVector2D(x - thicc, y + ih + thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w + thicc, y - thicc), FVector2D(x + w + thicc, y + ih + thicc), thicc, black);

    HUD->DebugCanvas->K2_DrawLine(FVector2D(x - thicc, y + h - ih - thicc), FVector2D(x + iw + thicc, y + h - ih - thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw - thicc, y + h - ih - thicc), FVector2D(x + w + thicc, y + h - ih - thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x - thicc, y + h + thicc), FVector2D(x + iw + thicc, y + h + thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw - thicc, y + h + thicc), FVector2D(x + w + thicc, y + h + thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x - thicc, y + h - ih - thicc), FVector2D(x - thicc, y + h + thicc), thicc, black);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w + thicc, y + h - ih - thicc), FVector2D(x + w + thicc, y + h + thicc), thicc, black);

    HUD->DebugCanvas->K2_DrawLine(FVector2D(x, y), FVector2D(x + iw, y), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw, y), FVector2D(x + w, y), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x, y), FVector2D(x, y + ih), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - 1, y), FVector2D(x + w - 1, y + ih), thicc, color);

    HUD->DebugCanvas->K2_DrawLine(FVector2D(x, y + h - ih), FVector2D(x + iw, y + h - ih), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw, y + h - ih), FVector2D(x + w, y + h - ih), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x, y + h), FVector2D(x + iw, y + h), thicc, color);
    HUD->DebugCanvas->K2_DrawLine(FVector2D(x + w - iw, y + h), FVector2D(x + w, y + h), thicc, color);
}

#define TSL_FONT_DEFAULT_SIZE 20
static UFont *robotoFont = 0, *robotoTinyFont = 0,*tslFont = 0;

void DrawOutlinedText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *DebugCanvas = HUD->DebugCanvas;

    FVector2D TextSize = DebugCanvas->K2_TextSize(robotoFont, Text, FVector2D(1.0f, 1.0f));

    if (isCenter) {
        Pos.X -= TextSize.X / 2;
        Pos.Y -= TextSize.Y / 2;
    }

    DebugCanvas->K2_DrawText(robotoFont, Text, Pos, Color, 0.5f, {}, {}, isCenter, isCenter, true, OutlineColor);
}
void DrawArrow(AHUD* HUD, FVector2D Point, float Angle, float Size, FLinearColor FillColor) {
    FVector2D Center = Point;

    int NumberOfSides = 3;  
    FVector2D Radius(Size, Size); 

    HUD->DebugCanvas->K2_DrawPolygon(nullptr, Center, Radius, NumberOfSides, FillColor);
}



void DrawText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, bool isCenter = false) {
UCanvas *DebugCanvas = HUD->DebugCanvas;
DebugCanvas->K2_DrawText(tslFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, false, {});
}


void DrawSmallOutlinedText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = false) {
    UCanvas *DebugCanvas = HUD->DebugCanvas;

    FVector2D TextSize = DebugCanvas->K2_TextSize(robotoTinyFont, Text, FVector2D(1.0f, 1.0f));

    if (isCenter) {
        Pos.X -= TextSize.X / 2;
        Pos.Y -= TextSize.Y / 2;
    }

    DebugCanvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}


void DrawSmallText(AHUD *HUD, FString Text, FVector2D Pos, FLinearColor Color, bool isCenter = false) {
    UCanvas *DebugCanvas = HUD->DebugCanvas;

    FVector2D TextSize = DebugCanvas->K2_TextSize(robotoTinyFont, Text, FVector2D(1.0f, 1.0f));

    if (isCenter) {
        Pos.X -= TextSize.X / 2;
        Pos.Y -= TextSize.Y / 2;
    }

    DebugCanvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, false, {});
}

void DrawTextcan(AHUD* HUD, FString Text, FVector2D Pos, FLinearColor Color, FLinearColor OutlineColor, bool isCenter = true) {
    UCanvas* DebugCanvas = HUD->DebugCanvas;
    FVector2D TextSize;

    FVector2D Scale(1.0f, 1.0f);

    TextSize = DebugCanvas->K2_TextSize(robotoTinyFont, Text, Scale);

    if (isCenter) {
        Pos.X -= TextSize.X / 2; 
        Pos.Y -= TextSize.Y / 2;  
    }

    DebugCanvas->K2_DrawText(robotoTinyFont, Text, Pos, Color, 1.f, {}, {}, isCenter, isCenter, true, OutlineColor);
}

void DrawCircle(AHUD *HUD, int x, int y, int radius, int numsides, FLinearColor OutlineColor){
    float Step = M_PI * 2.0 / numsides;
    int Count = 0;
    FVector2D V[128];
    for (float a = 0; a < M_PI * 2.0; a += Step)
    {
        float X1 = radius * cos(a) + x;
        float Y1 = radius * sin(a) + y;
        float X2 = radius * cos(a + Step) + x;
        float Y2 = radius * sin(a + Step) + y;
        V[Count].X = X1;
        V[Count].Y = Y1;
        V[Count + 1].X = X2;
        V[Count + 1].Y = Y2;
        HUD->DebugCanvas->K2_DrawLine(FVector2D({ V[Count].X, V[Count].Y }), FVector2D({ X2, Y2 }), 1.f, OutlineColor);
    }
}
void DrawTriangle(AHUD * HUD, float x1, float y1, float x2, float y2, float x3, float y3, float thickness, FLinearColor color) {
HUD->DrawRect( color,x1, y1, x2, y2);
HUD->DrawRect(color,x2, y2, x3, y3);
HUD->DrawRect(color,x3, y3, x1, y1);
}
void DrawFilledCircle(AHUD *HUD, int x, int y, int radius, int numsides, FLinearColor OutlineColor, FLinearColor FillColor){
    float Step = M_PI * 2.0 / numsides;
    FVector2D Center(x, y);
    FVector2D V[128];
    for (int i = 0; i < numsides; ++i)
    {
        // Calculate vertices for the i-th triangle
        float Angle = Step * i;
        V[i].X = Center.X + radius * cos(Angle);
        V[i].Y = Center.Y + radius * sin(Angle);

        // Draw lines from the center to the vertices
        HUD->DebugCanvas->K2_DrawLine(Center, V[i], 1.f, FillColor);
    }

    for (int i = 0; i < numsides; ++i)
    {
        HUD->DebugCanvas->K2_DrawLine(V[i], V[(i+1) % numsides], 1.f, OutlineColor);
    }
}


void *LoadFont() {
    while (!robotoFont || !robotoTinyFont || !tslFont) {
        tslFont = UObject::FindObject<UFont>("Font TSLFont.TSLFont");
        robotoFont = UObject::FindObject<UFont>("Font Roboto.Roboto");
        robotoTinyFont = UObject::FindObject<UFont>("Font RobotoTiny.RobotoTiny");
      sleep(1);
    }
    return 0;
}
bool _read(kaddr addr, void *buffer, int len)
{
    if (!IsValidAddress(addr)) return false;
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)addr, len, (vm_address_t)buffer, &size);
    if(error != KERN_SUCCESS || size != len)
    {
        return false;
    }
    return true;
}

bool _write(kaddr addr, void *buffer, int len)
{
    if (!IsValidAddress(addr)) return false;
    kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
    if(error != KERN_SUCCESS)
    {
        return false;
    }
    return true;
}
kaddr GetRealOffset(kaddr offset) {
    if (module == 0) {
        return 0;
    }
    return (module + offset);
}
template<typename T> T Read(kaddr addr) {
    T data;
    _read(addr, reinterpret_cast<void *>(&data), sizeof(T));
    return data;
}



#define W2S(w, s) UGameplayStatics::ProjectWorldToScreen(g_PlayerController, w, false, s)
FMatrix RotatorToMatrix(FRotator rotation) {
    float radPitch = rotation.Pitch * ((float)M_PI / 180.0f);
    float radYaw = rotation.Yaw * ((float)M_PI / 180.0f);
    float radRoll = rotation.Roll * ((float)M_PI / 180.0f);

    float SP = sinf(radPitch);
    float CP = cosf(radPitch);
    float SY = sinf(radYaw);
    float CY = cosf(radYaw);
    float SR = sinf(radRoll);
    float CR = cosf(radRoll);

    FMatrix matrix;

    matrix.M[0][0] = (CP * CY);
    matrix.M[0][1] = (CP * SY);
    matrix.M[0][2] = (SP);
    matrix.M[0][3] = 0;

    matrix.M[1][0] = (SR * SP * CY - CR * SY);
    matrix.M[1][1] = (SR * SP * SY + CR * CY);
    matrix.M[1][2] = (-SR * CP);
    matrix.M[1][3] = 0;

    matrix.M[2][0] = (-(CR * SP * CY + SR * SY));
    matrix.M[2][1] = (CY * SR - CR * SP * SY);
    matrix.M[2][2] = (CR * CP);
    matrix.M[2][3] = 0;

    matrix.M[3][0] = 0;
    matrix.M[3][1] = 0;
    matrix.M[3][2] = 0;
    matrix.M[3][3] = 1;

    return matrix;
}
FVector2D WorldToScreen(FVector worldLocation, FMinimalViewInfo camViewInfo, int width, int height) {
    FMatrix tempMatrix = RotatorToMatrix(camViewInfo.Rotation);

    FVector vAxisX(tempMatrix.M[0][0], tempMatrix.M[0][1], tempMatrix.M[0][2]);
    FVector vAxisY(tempMatrix.M[1][0], tempMatrix.M[1][1], tempMatrix.M[1][2]);
    FVector vAxisZ(tempMatrix.M[2][0], tempMatrix.M[2][1], tempMatrix.M[2][2]);

    FVector vDelta = worldLocation - camViewInfo.Location;

    FVector vTransformed(FVector::Dot(vDelta, vAxisY), FVector::Dot(vDelta, vAxisZ), FVector::Dot(vDelta, vAxisX));

    if (vTransformed.Z < 1.0f) {
        vTransformed.Z = 1.0f;
    }

    float fov = camViewInfo.FOV;
    float screenCenterX = (width / 2.0f);
    float screenCenterY = (height / 2.0f);

    return FVector2D(
        (screenCenterX + vTransformed.X * (screenCenterX / tanf(fov * ((float)M_PI / 360.0f))) / vTransformed.Z),
        (screenCenterY - vTransformed.Y * (screenCenterX / tanf(fov * ((float)M_PI / 360.0f))) / vTransformed.Z)
    );
}

FVector WorldToRadar(float Yaw, FVector Origin, FVector LocalOrigin, float PosX, float PosY, Vector3 Size, bool &outbuff) {
    bool flag = false;
    double num = (double)Yaw;
    double num2 = num * 0.017453292519943295;
    float num3 = (float)std::cos(num2);
    float num4 = (float)std::sin(num2);
    float num5 = Origin.X - LocalOrigin.X;
    float num6 = Origin.Y - LocalOrigin.Y;

    struct FVector Xector;
    Xector.X = (num6 * num3 - num5 * num4) / 150.f;
    Xector.Y = (num5 * num3 + num6 * num4) / 150.f;

    struct FVector Xector2;
    Xector2.X = Xector.X + PosX + Size.X / 2.f;
    Xector2.Y = -Xector.Y + PosY + Size.Y / 2.f;

    bool flag2 = Xector2.X > PosX + Size.X;
    if (flag2) {
        Xector2.X = PosX + Size.X;
    } else {
        bool flag3 = Xector2.X < PosX;
        if (flag3) {
            Xector2.X = PosX;
        }
    }

    bool flag4 = Xector2.Y > PosY + Size.Y;
    if (flag4) {
        Xector2.Y = PosY + Size.Y;
    } else {
        bool flag5 = Xector2.Y < PosY;
        if (flag5) {
            Xector2.Y = PosY;
        }
    }

    bool flag6 = Xector2.Y == PosY || Xector2.X == PosX;
    if (flag6) {
        flag = true;
    }
    outbuff = flag;
    return Xector2;
}

void FixTriangle(float& XPos, float& YPos, int screenDist) {
    // —————————Triangle X Pos—————————————
    if (XPos > (screenWidth - 16)) {
        XPos = screenWidth;
        XPos -= screenDist;
    }
    // ——————————————————————
    if (XPos < 16) {
        XPos = 16;
        XPos += screenDist;
    }
    // ————————— Triangle Y Pos —————————————
    if (YPos > (screenHeight - 16)) {
        YPos = screenHeight;
        YPos -= screenDist;
    }
    if (YPos < 16) {
        YPos = 16;
        YPos += screenDist;
    }
}

void VectorAnglesRadar(FVector& forward, FVector& angles) {
    if (forward.X == 0.f && forward.Y == 0.f) {
        angles.X = forward.Z > 0.f ? -90.f : 90.f;
        angles.Y = 0.f;
    } else {
        angles.X = RAD2DEG(atan2(-forward.Z, forward.Size()));
        angles.Y = RAD2DEG(atan2(forward.Y, forward.X));
    }
    angles.Z = 0.f;
}

void RotateTriangle(std::array<Vector3, 3>& points, float rotation) {
    const auto points_center = (points.at(0) + points.at(1) + points.at(2)) / 3;
    for (auto& point : points) {
        point = point - points_center;
        const auto temp_x = point.X;
        const auto temp_y = point.Y;
        const auto theta = DEG2RAD(rotation);
        const auto c = cosf(theta);
        const auto s = sinf(theta);
        point.X = temp_x * c - temp_y * s;
        point.Y = temp_x * s + temp_y * c;
        point = point + points_center;
    }
}

UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();

static std::unordered_set<uint32_t> AlreadyChangedSet;

uintptr_t GetVirtualFunctionAddress(uintptr_t clazz, uintptr_t index) {
    if (!clazz) {
        return 0;
    }
    uintptr_t vtablePtr = *(uintptr_t*)clazz;
    if (!vtablePtr) {
        return 0;
    }
    // Ensure index is within bounds of the vtable
    if (index < 0) {
        return 0;
    }
    return *((uintptr_t*)vtablePtr + index);
}

void ChangeItemAVc(uintptr_t thiz, int InItemID) {
    if (thiz) {
        auto PrechangeitemAvatar_addr = GetVirtualFunctionAddress(thiz, 182); //vtable idx
        if (PrechangeitemAvatar_addr) {
            return ((void(*)(uintptr_t, int, bool))PrechangeitemAvatar_addr)(thiz, InItemID, true);
        }
    }
}

int glWidth, glHeight;

bool isInsideFOV(int x, int y) {
  if (!preferences.Config.SilentAim.Cross)
    return true;
  int circle_x = screenWidth / 2;
  int circle_y = screenHeight / 2;
  int rad = (int)preferences.Config.SilentAim.Cross * 2;
  return (x - circle_x) * (x - circle_x) + (y - circle_y) * (y - circle_y) <=
         rad * rad;
}
ASTExtraPlayerCharacter* GetTargetByCrossDist(FVector &out_target_pos) {
    ASTExtraPlayerCharacter *result = nullptr;
    float max = std::numeric_limits<float>::infinity();
    int _bone_priority = 11;
    FVector target_pos;

    static std::vector<std::pair<int, std::string>> priority_structure = {
        {1, "Head"}, {2, "spine_02"}, {3, "pelvis"},
        {4, "clavicle_r"}, {4, "clavicle_l"}, {5, "upperarm_r"},
        {5, "upperarm_l"}, {6, "lowerarm_r"}, {6, "lowerarm_l"},
        {7, "hand_r"}, {7, "hand_l"}, {8, "thigh_r"},
        {8, "thigh_l"}, {9, "calf_r"}, {9, "calf_l"},
        {10, "foot_r"}, {10, "foot_l"}
    };

    auto localPlayer = g_LocalPlayer;
    auto localController = g_PlayerController;

    if (localPlayer && localController) {
        std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
        GetAllActors(PlayerCharacter);
        for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); ++actor) {
            auto Player = *actor;

            if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;

            if (Player->TeamID == localPlayer->TeamID)
                continue;

            if (Player->bDead)
                continue;

            if (Player->bHidden)
                continue;

            if (!Player->Mesh)
                continue;

            if (!Player->RootComponent)
                continue;

            if (preferences.Config.SilentAim.IgnoreKnocked && Player->Health == 0.0f)
                continue;

            if (preferences.Config.SilentAim.IgnoreBot && Player->bEnsure)
                continue;

            float dist = localPlayer->GetDistanceTo(Player) / 100.0f;
            if (dist > g_Memory.g_disstance)
                continue;

            if (preferences.Config.SilentAim.VisCheck) {
                auto CurrentWeaponReplicated =
                    (ASTExtraShootWeapon *)localPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
                if (CurrentWeaponReplicated != nullptr) {
                    FVector muzzle_pos = CurrentWeaponReplicated->GetMuzzleTransform().Translation;
  // Корректировка Z координаты

                    for (const auto& bone : priority_structure) {
                        FVector bone_pos = Player->GetBonePos(FName(bone.second.c_str()), FVector());
                         if (bone.second == "Head") {
        // Смещение точки прицеливания вверх на 12 единиц
        bone_pos.Z += 12.0f;
    }

                        if (line_trace_single(localPlayer, muzzle_pos, bone_pos))
                            continue;

                        if (_bone_priority > bone.first) {
                            _bone_priority = bone.first;
                            target_pos = bone_pos;
                        }
                    }

          bool visible = line_trace_single(localPlayer, muzzle_pos, target_pos);
          if (visible) {
            continue;
          }
        }
      }
      FVector2D target_pos2D;

      if ((target_pos, &target_pos2D)) {

        if ((target_pos2D.X >= 0 &&
             target_pos2D.X <= static_cast<float>(glWidth)) &&
            (target_pos2D.Y >= 0 &&
             target_pos2D.Y <= static_cast<float>(glHeight))) {

          FVector2D v2Middle(static_cast<float>(glWidth / 2),
                             static_cast<float>(glHeight / 2));
          if (isInsideFOV(static_cast<int>(target_pos2D.X),
                          static_cast<int>(target_pos2D.Y))) {
            float distance = FVector2D::Distance(v2Middle, target_pos2D);
            if (distance < max) {
              max = distance;
              result = Player;
              out_target_pos = target_pos;
            }
          }
        }
      }
    }
  }
  return result;
}


auto GetCurrentWeaponReplicated(ASTExtraPlayerCharacter *mode) {
  auto WeaponManagerComponent = mode->WeaponManagerComponent;
  if (WeaponManagerComponent) {
    auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
    if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3) {
      return (ASTExtraShootWeapon *)
          WeaponManagerComponent->CurrentWeaponReplicated;
    }
  }
}


void (*orig_shoot_event)(USTExtraShootWeaponComponent *thiz, FVector start,
                         FRotator rot, void *unk1, int unk2) = 0;
                         
void shoot_event(USTExtraShootWeaponComponent *thiz, FVector start,
                 FRotator rot, ASTExtraShootWeapon *weapon, int unk1) {
     FRotator CurrentRotation; // Предположим, есть геттер
CurrentRotation.Yaw = g_Memory.CurRotYaw;
CurrentRotation.Pitch = g_Memory.CurRotPitch;
CurrentRotation.Roll = g_Memory.CurRotRoll;
    // Увеличение угла Yaw для вращения по часовой стрелке
   // Увеличение на фиксированное значение

    // Ограничение угла в пределах 360 градусов
  

    // Передача измененного вращения обратно в функцию RotateCrossHair
    thiz->OwnerShootWeapon->RotateCrossHair(CurrentRotation);
  if (preferences.Config.SilentAim.Enable) {

    FVector target_aim_pos;
    ASTExtraPlayerCharacter *Target = GetTargetByCrossDist(target_aim_pos);

    // Проверка на то, что target_aim_pos не равен FVector(0, 0, 0)
    if (Target && !(target_aim_pos.X == 0.0f && target_aim_pos.Y == 0.0f && target_aim_pos.Z == 0.0f)) {
      bool triggerOk = false;
      if (preferences.Config.SilentAim.Trigger != EAimTrigger::None) {
        if (preferences.Config.SilentAim.Trigger == EAimTrigger::Shooting) {
          triggerOk = g_LocalPlayer->bIsWeaponFiring;
        } else if (preferences.Config.SilentAim.Trigger ==
                   EAimTrigger::Scoping) {
          triggerOk = g_LocalPlayer->bIsGunADS;
        } else if (preferences.Config.SilentAim.Trigger == EAimTrigger::Both) {
          triggerOk =
              g_LocalPlayer->bIsWeaponFiring && g_LocalPlayer->bIsGunADS;
        } else if (preferences.Config.SilentAim.Trigger == EAimTrigger::Any) {
          triggerOk =
              g_LocalPlayer->bIsWeaponFiring || g_LocalPlayer->bIsGunADS;
        }
      } else {
        triggerOk = true;
      }

      if (triggerOk) {
        UShootWeaponEntity *ShootWeaponEntityComponent =
            thiz->ShootWeaponEntityComponent;

        if (ShootWeaponEntityComponent) {
          ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
          if (CurrentVehicle) {
            FVector LinearVelocity =
                CurrentVehicle->ReplicatedMovement.LinearVelocity;

            float dist = g_LocalPlayer->GetDistanceTo(Target);
            auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;

            target_aim_pos = UKismetMathLibrary::Add_VectorVector(
                target_aim_pos, UKismetMathLibrary::Multiply_VectorFloat(
                                    LinearVelocity, timeToTravel));
          } else {
            FVector Velocity = Target->GetVelocity();

            float dist = g_LocalPlayer->GetDistanceTo(Target);
            auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;

            target_aim_pos = UKismetMathLibrary::Add_VectorVector(
                target_aim_pos, UKismetMathLibrary::Multiply_VectorFloat(
                                    Velocity, timeToTravel));
          }
          FVector fDir =
              UKismetMathLibrary::Subtract_VectorVector(target_aim_pos, start);
          FRotator sex = UKismetMathLibrary::Conv_VectorToRotator(fDir);
          rot = sex;
        }
      }
    }
  }

  return orig_shoot_event(thiz, start, rot, weapon, unk1);
}




std::wstring NStoWS(NSString *Str) {
  NSStringEncoding pEncode =
      CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF32LE);
  NSData *pSData = [Str dataUsingEncoding:pEncode];
  return std::wstring((wchar_t *)[pSData bytes],
                      [pSData length] / sizeof(wchar_t));
}
NSString *WStoNS(const std::wstring &Str) {
  NSString *pString =
      [[NSString alloc] initWithBytes:(char *)Str.data()
                               length:Str.size() * sizeof(wchar_t)
                             encoding:CFStringConvertEncodingToNSStringEncoding(
                                          kCFStringEncodingUTF32LE)];
  return pString;
}
void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight) {

  ASTExtraPlayerCharacter *localPlayer = 0;
  ASTExtraPlayerController *localPlayerController = 0;
  glWidth = ScreenWidth;
  glHeight = ScreenHeight;
  UCanvas *DebugCanvas = HUD->DebugCanvas;
  if (DebugCanvas) {

    static bool loadFont = false;
    if (!loadFont) {
      LoadFont();
      loadFont = true;
    }

    if (!robotoFont || !tslFont || !robotoTinyFont)
      return;
    robotoTinyFont->LegacyFontSize = 25;

    UGameplayStatics *gGameplayStatics =
        (UGameplayStatics *)UGameplayStatics::StaticClass();
    auto Actors = getActors();

    auto GWorlld = GetFullWorld();
    if (GWorlld) {

      for (int i = 0; i < Actors.size(); i++) {
        auto Actor = Actors[i];
        if (isObjectInvalid(Actor))
          continue;


      }
    }
    auto GWorld = GetFullWorld();
    if (GWorld) {
      UNetDriver *NetDriver = GWorld->NetDriver;
      if (NetDriver) {
        UNetConnection *ServerConnection = NetDriver->ServerConnection;
        if (ServerConnection) {
          localPlayerController =
              (ASTExtraPlayerController *)ServerConnection->PlayerController;
        }
      }
      if (localPlayerController) {

        std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
        GetAllActors(PlayerCharacter);
        for (auto actor = PlayerCharacter.begin();
             actor != PlayerCharacter.end(); actor++) {
          auto Actor = *actor;

          if (Actor->PlayerKey ==
              ((ASTExtraPlayerController *)localPlayerController)->PlayerKey) {
            localPlayer = Actor;
            break;
          }
        }

        {

          static bool bShooting = false;

          if (localPlayer) {
            
            if (localPlayer->PartHitComponent) {
              auto ConfigCollisionDistSqAngles =
                  localPlayer->PartHitComponent->ConfigCollisionDistSqAngles;
              for (int j = 0; j < ConfigCollisionDistSqAngles.Num(); j++) {
                ConfigCollisionDistSqAngles[j].Angle = 90.0f;
              }
              localPlayer->PartHitComponent->ConfigCollisionDistSqAngles =
                  ConfigCollisionDistSqAngles;
            }
            if (localPlayer->PartHitComponent) {
              auto ConfigCollisionDistSqAngles =
                  localPlayer->PartHitComponent->ConfigCollisionDistSqAngles;
              for (int j = 0; j < ConfigCollisionDistSqAngles.Num(); j++) {
                ConfigCollisionDistSqAngles[j].Angle = 180.0f;
              }
              localPlayer->PartHitComponent->ConfigCollisionDistSqAngles =
                  ConfigCollisionDistSqAngles;
            }
            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)localPlayer->WeaponManagerComponent->CurrentWeaponReplicated;

            auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;

            if (g_Memory.InstantHit) {
              auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();

              if ((int)propSlot.GetValue() >= 1 &&
                  (int)propSlot.GetValue() <= 3) {
                auto WeaponManagerComponent =
                    localPlayer->WeaponManagerComponent;
                if (WeaponManagerComponent) {
                  auto CurrentWeaponReplicated =
                      (ASTExtraShootWeapon *)
                          WeaponManagerComponent->CurrentWeaponReplicated;
                  if (CurrentWeaponReplicated) {
                    auto ShootWeaponEntityComp =
                        CurrentWeaponReplicated->ShootWeaponEntityComp;

                    if (ShootWeaponEntityComp) {
                      ShootWeaponEntityComp->BulletNumSingleShot = 1;
                      ShootWeaponEntityComp->BulletFireSpeed = 700000;
                      

                    }
                  }
                }
              }
            }
            if (g_Memory.magicpidor) {
              auto Mesh = localPlayer->Mesh;
              if (Mesh) {
                auto SkeletalMesh = Mesh->SkeletalMesh;
                if (SkeletalMesh) {
                  auto PhysicsAsset = SkeletalMesh->PhysicsAsset;
                  if (PhysicsAsset) {
                    auto SkeletalBodySetups = PhysicsAsset->SkeletalBodySetups;
                    for (int z = 0; z < SkeletalBodySetups.Num(); z++) {
                      auto SkeletalBodySetup = SkeletalBodySetups[z];
                      if (SkeletalBodySetup) {
                        auto AggGeom = SkeletalBodySetup->AggGeom;
                        auto BoxElems = AggGeom.BoxElems;
                        for (int v = 0; v < BoxElems.Num(); v++) {
                          BoxElems[v].X = 260.0f;
                          BoxElems[v].Y = 260.0f;
                        }
                      }
                    }
                  }
                }
              }
            }
            if (g_Memory.animbreak) {
              //bool bIsInAir =
                 // g_LocalPlayer->GetMovementComponent()->IsFalling();

              localPlayer->StopAllAnimations(true);
            }
            if (g_Memory.AirControl666) {
              if (localPlayer->CharacterMovement) {
                localPlayer->CharacterMovement->AirControl = 99999999.0f;
                 localPlayer->CharacterMovement->MaxAcceleration = 999999.0f;
                  //localPlayer->CharacterMovement->MovementMode = EMovementMode::MOVE_Walking;
              }
            }

   if (g_Memory.isEnabled) {
        // Получение времени прошедшего с последнего кадра
        static float accumulatedTime = 0.0f;
        float deltaTime = 0.05f; // Обновите это значение по необходимости
        accumulatedTime += deltaTime;

        // Применение антиаима в зависимости от выбранного типа
        if (g_Memory.isStatic) {
            localPlayer->MeshContainer->RelativeRotation = { 
                g_Memory.staticPitchOffset, 
                g_Memory.staticYawOffset, 
                0.0f 
            };
        } else if (g_Memory.isJitter) {
    // Переключение между двумя значениями без задержек
    static bool useFirst = true; // Используем static для сохранения состояния между кадрами

    // Сменим значение через заданное количество времени
    static float lastSwitchTime = 0.0f;
    float jitterSwitchInterval = 0.01f; // Интервал переключения (время в секундах)
    
    if (accumulatedTime - lastSwitchTime >= jitterSwitchInterval) {
        // Обновляем время последнего переключения
        lastSwitchTime = accumulatedTime;
        // Переключаем значение
        useFirst = !useFirst;
    }

    float jitterYaw = useFirst ? g_Memory.jitterYawOffset1 : g_Memory.jitterYawOffset2;
    float jitterPitch = useFirst ? g_Memory.jitterPitchOffset1 : g_Memory.jitterPitchOffset2;
localPlayer->DefaultMeshRot = { 
        jitterPitch, 
        jitterYaw, 
        0.0f 
    };
    // localPlayer->MeshContainer->RelativeRotation = { 
    //     jitterPitch, 
    //     jitterYaw, 
    //     0.0f 
    // };
}
 else if (g_Memory.isSpin) {
            // Вращение по часовой стрелке
            float spinYaw = g_Memory.spinYawOffset * accumulatedTime;
            float spinPitch = g_Memory.spinPitchOffset * accumulatedTime;

            localPlayer->MeshContainer->RelativeRotation = { 
                spinPitch, 
                spinYaw, 
                0.0f 
            };
        } else {
            // Режим по умолчанию или когда антиаим не активен
            localPlayer->MeshContainer->RelativeRotation = { 
                0.0f, 
                0.0f, 
                0.0f 
            };
        }
    }

if (g_Memory.DamageFix)
{
  auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();

if ((int)propSlot.GetValue() >= 1 &&
    (int)propSlot.GetValue() <= 3) {
  auto WeaponManagerComponent =
      localPlayer->WeaponManagerComponent;
  if (WeaponManagerComponent) {
    auto CurrentWeaponReplicated =
        (ASTExtraShootWeapon *)
            WeaponManagerComponent->CurrentWeaponReplicated;
    if (CurrentWeaponReplicated) {
      auto ShootWeaponEntityComp =
          CurrentWeaponReplicated->ShootWeaponEntityComp;

      if (ShootWeaponEntityComp) {
       //   ShootWeaponEntityComp->ShootIntervalShowNumber = 0;
     //     ShootWeaponEntityComp->ExtraShootInterval = 0.f;
     //     ShootWeaponEntityComp->ExtraShootIntervalShowNumber = 0;
      //    ShootWeaponEntityComp->ClientShootIntervalControl = false;
      //    ShootWeaponEntityComp->bForceUseShootIntervalConsistent = false;
       //   ShootWeaponEntityComp->ClientPreVerifyBlock = false;
        //  ShootWeaponEntityComp->bHasSingleFireMode = false;
        //  ShootWeaponEntityComp->bHasAutoFireMode = true;
        //  ShootWeaponEntityComp->VehicleDamageScale = 9999999.f;
        //  ShootWeaponEntityComp->BulletMomentum = 11110.f;
//ShootWeaponEntityComp->bIsReasonable = true;
//ShootWeaponEntityComp->BurstShootBulletsNum = 1;
//ShootWeaponEntityComp->BurstShootCD = 0.f;
//localPlayer->IsOpenCommonShootVerify = false;
      
        }
      }
    }
  }

localPlayer->ResetCharacter();


}



if ( localPlayer->IsClientPeeking )
{
  if ( localPlayer->IsPeekLeft )
  {
    g_Memory.staticPitchOffset = 90.f;
          g_Memory.staticYawOffset = 90.f;

  }
    else 
    {
      g_Memory.staticPitchOffset = 90.f;
      g_Memory.staticYawOffset = 290.f;
    }
} 
else
{
   g_Memory.staticPitchOffset = 0.f;
         g_Memory.staticYawOffset = 0.f;

}
    if (g_Memory.zhuiluo) {
           localPlayer->JumpMaxCount = 99999;
           //localPlayer->JumpCurrentCount = 0;
           //localPlayer->bClientWasFalling = 0;
           //localPlayer->JumpKeyHoldTime = 0.f;
           //localPlayer->bSimGravityDisabled = 0;
         //  localPlayer->bClientCheckEncroachmentOnNetUpdate = 0;
         //  localPlayer->bClientUpdating = 0;
         //  localPlayer->bClientResimulateRootMotion = 0;
       //    localPlayer->bClientResimulateRootMotionSources = 0;
        //   localPlayer->bServerMoveIgnoreRootMotion = 0;
        //   localPlayer->CrouchedEyeHeight = 999.f;
     //   g_LocalPlayer->StandHalfHeight = 77.0f;
    //    g_LocalPlayer->CrouchHalfHeight = -63.0f;
   //      localPlayer->ProneHalfHeight = -63.0f;
localPlayer->SetJumpToLandHeight(9999.f);
localPlayer->SetRainyEffectEnable(EScreenParticleEffectType::ESPET_DustStorm,true,999.f );
localPlayer->UpdateParachuteState({0,0,0}, 9999.f);
localPlayerController->KickPlayerFromGame();
localPlayerController->JumpFromPlane();
          // localPlayer->Ping = 120.f;
      //     localPlayer->bIsSkillFlying = true;
//localPlayer->bMoveHasCollision = false;

           //localPlayer->CanJump();
          // localPlayer->CanJumpInternal();
         //  localPlayer->K2_UpdateCustomMovement(0.05f);
          // localPlayer->StopAnimMontage(FThrowableAnim);
    //        float gravityScale = 0.0f;
    // if (!IsJump) {
    //     gravityScale = 1.0f; // If not jumping, set gravity scale to 1.0
    // }
    //        CharacterMovement->GravityScale = gravityScale;
    }
//localPlayer->JumpKeyHoldTime = 0.f;

            if (g_Memory.PlayerDance2) {
              USceneComponent *MeshContainer = localPlayer->MeshContainer;

              if (!g_Memory.visible) {
                g_Memory.DanceValue += 360.0f * 0.11f;
                if (g_Memory.DanceValue >= 360.0f) {
                  g_Memory.DanceValue -= 360.0f;
                }
              }

              MeshContainer->RelativeRotation = {g_Memory.pidorasinax, g_Memory.DanceValue,
                                                 g_Memory.pidorasinaz};
            }

            if (g_Memory.crazycar) {
              if (localPlayer->CurrentVehicle) {
                auto currentVehicle = localPlayer->CurrentVehicle;
                auto rootComponent = static_cast<UPrimitiveComponent *>(
                    currentVehicle->K2_GetRootComponent());
                rootComponent->SetEnableGravity(false);

                if (localPlayer->CurrentVehicle->GetMoveForwardRate() > 0) {
                  FVector velocity;
                  auto yawRotation = g_PlayerController->PlayerCameraManager
                                         ->CameraCache.POV.Rotation.Yaw;
                  float angleInRadians = 2.f * M_PI * (yawRotation / 360.f);

                  velocity.X = 120.0f * cosf(angleInRadians);
                  velocity.Y = 0.f;

                  rootComponent->SetAllPhysicsLinearVelocity(velocity, true);
                }
              }
            }

            if (WeaponManagerComponent) {
              auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
              if ((int)propSlot.GetValue() >= 1 &&
                  (int)propSlot.GetValue() <= 3) {
                auto CurrentWeaponReplicated =
                    (ASTExtraShootWeapon *)
                        WeaponManagerComponent->CurrentWeaponReplicated;
                if (CurrentWeaponReplicated) {
                  auto ShootWeaponEntityComp =
                      CurrentWeaponReplicated->ShootWeaponEntityComp;
                  if (ShootWeaponEntityComp) {
                    ShootWeaponEntityComp->DeviationInfo
                        .DeviationMoveMultiplier = g_Memory.Norecoil ? 0.f : 1.f;
                    ShootWeaponEntityComp->CrossHairInitialSize =
                        g_Memory.Norecoil ? -8.542f : 1.f;
                    ShootWeaponEntityComp->GameDeviationFactor =
                        g_Memory.Norecoil ? 0.f : 1.f;
                    ShootWeaponEntityComp->InitBulletInClip =
                        g_Memory.Norecoil ? 100 : 1;
                    ShootWeaponEntityComp->AnimationKick = g_Memory.Norecoil ? 0.f : 1.f;
                    ShootWeaponEntityComp->AccessoriesRecoveryFactor =
                        g_Memory.Norecoil ? 0.f : 1.f;
                    ShootWeaponEntityComp->AccessoriesHRecoilFactor =
                        g_Memory.Norecoil ? 0.f : 1.f;
                    ShootWeaponEntityComp->AccessoriesVRecoilFactor =
                        g_Memory.Norecoil ? 0.f : 1.f;
                        ShootWeaponEntityComp->bDrawCrosshairWhenScope = true;
                  }
                }
              }
            }


    auto localController = g_PlayerController;
            if (g_Memory.XHIT666 && localController) {
              
             auto MyHUD = (ASurviveHUD*) localController->MyHUD;
              if ( MyHUD )
              {
                  float deltaTime = 0.1f;
    MyHUD->HitPerform.HitBodyDrawColor = get_rainbow_color(deltaTime);
     MyHUD->HitPerform.HitHeadDrawColor = get_rainbow_color(deltaTime);
                auto hit_perform = *(uintptr_t*)((uintptr_t) MyHUD + 0x598);
                if ( hit_perform )
                {
    *(float*)(hit_perform + 0x10) = g_Memory.hit_size;
    *(float*)(hit_perform + 0x50) = g_Memory.hit_size;
    *(float*)(hit_perform + 0x90) = g_Memory.hit_size;
    *(float*)(hit_perform + 0xD0) = g_Memory.hit_size;
                  
                }
              }
            }


static ULocalPlayer *UlocalPlayer = nullptr;
    if (!UlocalPlayer)
    {
        UlocalPlayer = UObject::FindObject<ULocalPlayer>("LocalPlayer Transient.UAEGameEngine_1.LocalPlayer_1");
    }

    if (UlocalPlayer == nullptr)
        return;



    static auto OrigView = UlocalPlayer->AspectRatioAxisConstraint;
    if (g_Memory.WideView)
    {
        UlocalPlayer->AspectRatioAxisConstraint = EAspectRatioAxisConstraint::AspectRatio_MaintainYFOV;
    }
    else
    {
        if (UlocalPlayer->AspectRatioAxisConstraint != OrigView)
        {
            UlocalPlayer->AspectRatioAxisConstraint = OrigView;
        }
    }


            if (g_Memory.fps120) {
              auto objs = UObject::GetGlobalObjects();
              for (int i = 0; i < objs.Num(); i++) {
                auto Object = objs.GetByIndex(i);
                if (isObjectInvalid(Object))
                  continue;
                if (Object->IsA(USTExtraGameInstance::StaticClass())) {
                  auto playerChar = (USTExtraGameInstance *)Object;
                  playerChar->UserDetailSetting.PUBGDeviceFPSDef = 120;
                  playerChar->UserDetailSetting.PUBGDeviceFPSLow = 120;
                           playerChar->UserDetailSetting.PUBGDeviceFPSMid = 120;
                  playerChar->UserDetailSetting.PUBGDeviceFPSHigh = 120;
                  playerChar->UserDetailSetting.PUBGDeviceFPSHDR = 120;
                  playerChar->UserDetailSetting.PUBGDeviceFPSUltralHigh = 120;
                }
              }
            }
            if (g_Memory.SpeedKnock) {
              if ( localPlayer )
              {
              localPlayer->SpeedScale = 9999999;
              localPlayer->EnergySpeedScale = 99999999;
              }
            }

            localPlayer->STPlayerController->SetIsSnowy(g_Memory.Snow);
            localPlayer->STPlayerController->SetIsRainy(g_Memory.Rain);
            localPlayer->STPlayerController->SetIsBlizzard(g_Memory.Blizzard);
if(g_Memory.rapidfire)
{
  if (CurrentWeaponReplicated)
  {
  auto ShootWeaponEntityComp =
                      CurrentWeaponReplicated->ShootWeaponEntityComp;
                  if (ShootWeaponEntityComp) {
                        ShootWeaponEntityComp->ShootInterval = 0.f;
                        ShootWeaponEntityComp->BurstShootInterval = 0.f;
 
    }                             
    
                      //  localPlayer->CurShootIntervalMode = (EWeaponShootIntervalMode__EWeaponShootIntervalMode_A);

}
}
            if (g_Memory.startedfirenig) {
              g_Memory.startedfirenig = false;
              g_PlayerController->OnReleaseFire();
            }


if (g_Memory.ShowDamage) {
    if (localPlayer->bIsWeaponFiring) {

        ((ASTExtraPlayerController *) (localPlayer->Controller))->GameReplayType = 2;

    } else {

        ((ASTExtraPlayerController *) (localPlayer->Controller))->GameReplayType = 1;
    }
}
if (g_Memory.ShowDamage)
{
  UObject *Object;
    if (Object->IsA(UDamageNumberWidget::StaticClass()))
    {
        auto LuaDamageInfo = (UDamageNumberWidget *) Object;
        auto DamageNumberConfigArray = LuaDamageInfo->DamageNumberConfigArray;
        for (int x = 0; x < DamageNumberConfigArray.Num(); ++x)
        {
            FDamageNumberConfig & DamageNumberConfig = DamageNumberConfigArray[x];
            FLinearColor BloodRedColor(1.0f, 1.0f, 1.0f, 1.0f);
            DamageNumberConfig.HeadDrawColor = BloodRedColor; 
            DamageNumberConfig.BodyDrawColor = BloodRedColor; 
            DamageNumberConfig.HeadDrawOutlineColor = BloodRedColor; 
            DamageNumberConfig.BodyDrawOutlineColor = BloodRedColor; 
            DamageNumberConfig.UpScaleFactor = 1.f; 
            DamageNumberConfig.ScaleRandOffset = 0.0f; 

        }
    }
}
 if (g_Memory.WeaponScale) 
 {
    auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)localPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
      if (CurrentWeaponReplicated)
      {
       CurrentWeaponReplicated->RootComponent->SetWorldScale3D({1000,10000,1000});
       CurrentWeaponReplicated->RootComponent->SetRelativeScale3D({1000,1000,1000});
        //Scale
        CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = g_Memory.WeaponScaleChangerX;
        CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = g_Memory.WeaponScaleChangerY;
        CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = g_Memory.WeaponScaleChangerZ;
        //Location
        CurrentWeaponReplicated->RootComponent->RelativeLocation.X = g_Memory.WeaponRelativeLocX;
        CurrentWeaponReplicated->RootComponent->RelativeLocation.Y = g_Memory.WeaponRelativeLocY;
        CurrentWeaponReplicated->RootComponent->RelativeLocation.Z = g_Memory.WeaponRelativeLocZ;
        //Rotation
        CurrentWeaponReplicated->RootComponent->RelativeRotation = {g_Memory.WeaponRelativeRotX, g_Memory.WeaponRelativeRotY, g_Memory.WeaponRelativeRotZ};

      }
}


            if (g_Memory.NoGravity){
    //           UCharacterMovementComponent *CharacterMovement = localPlayer->CharacterMovement;
    //                if (CharacterMovement) {
    //            CharacterMovement->JumpZVelocity = 0.f;

    // float gravityScale = 0.0f;
    // if (!localPlayerController->bIsJumping) {
    //     gravityScale = 1.0f;
    // }
    // CharacterMovement->GravityScale = gravityScale;

    // if (zhuiluo) {
    //     CharacterMovement->GravityScale = 1.0f;
    //     CharacterMovement->JumpZVelocity = 443.f;
    // }
    //           }
    localPlayer->JumpMaxCount = 99999;
            }

// if (preferences.Config.Aimbot.Enable) {
//     FVector target_aim_pos;
//     ASTExtraPlayerCharacter *Target = GetTargetByCrossDist(target_aim_pos);

//     // Проверка на то, что target_aim_pos не равен FVector(0, 0, 0)
//     if (Target && !(target_aim_pos.X == 0.0f && target_aim_pos.Y == 0.0f && target_aim_pos.Z == 0.0f)){
//         bool triggerOk = false;
//         if (preferences.Config.Aimbot.Trigger != JsonPreferences::EAimTrigger::None) {
//             if (preferences.Config.Aimbot.Trigger == JsonPreferences::EAimTrigger::Shooting) {
//                 triggerOk = localPlayer->bIsWeaponFiring;
//             } else if (preferences.Config.Aimbot.Trigger == JsonPreferences::EAimTrigger::Scoping) {
//                 triggerOk = localPlayer->bIsGunADS;
//             } else if (preferences.Config.Aimbot.Trigger == JsonPreferences::EAimTrigger::Both) {
//                 triggerOk = localPlayer->bIsWeaponFiring && localPlayer->bIsGunADS;
//             } else if (preferences.Config.Aimbot.Trigger == JsonPreferences::EAimTrigger::Any) {
//                 triggerOk = localPlayer->bIsWeaponFiring || localPlayer->bIsGunADS;
//             }
//         } else {
//             triggerOk = true;
//         }

//         if (triggerOk) {
//             FVector targetAimPos;
//             if (preferences.Config.Aimbot.Target == JsonPreferences::EAimTarget::Head) {
//                 targetAimPos = Target->GetBonePos("Head", {});
//             }
//             if (preferences.Config.Aimbot.Target == JsonPreferences::EAimTarget::Chest) {
//                 targetAimPos = Target->GetBonePos("pelvis", {});
//             }
//             if (preferences.Config.Aimbot.ReCo) {
//                 if (g_LocalPlayer->bIsGunADS && g_LocalPlayer->bIsWeaponFiring) {
//                     float dist = g_LocalPlayer->GetDistanceTo(Target) / 100.f;
//                     targetAimPos.Z -= dist * preferences.Config.Aimbot.Recc;
//                 }
//             }
//             if (WeaponManagerComponent) {
//                 auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
//                 if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3) {
//                     auto CurrentWeaponReplicated = (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
//                     if (CurrentWeaponReplicated) {
//                         auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
//                         if (ShootWeaponComponent) {
//                             UShootWeaponEntity *ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
//                             if (ShootWeaponEntityComponent) {
//           ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
//           if (CurrentVehicle) {
//             FVector LinearVelocity =
//                 CurrentVehicle->ReplicatedMovement.LinearVelocity;

//             float dist = g_LocalPlayer->GetDistanceTo(Target);
//             auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;

//             target_aim_pos = UKismetMathLibrary::Add_VectorVector(
//                 target_aim_pos, UKismetMathLibrary::Multiply_VectorFloat(
//                                     LinearVelocity, timeToTravel));
//           } else {
//             FVector Velocity = Target->GetVelocity();

//             float dist = g_LocalPlayer->GetDistanceTo(Target);
//             auto timeToTravel = dist / ShootWeaponEntityComponent->BulletFireSpeed;

//             target_aim_pos = UKismetMathLibrary::Add_VectorVector(
//                 target_aim_pos, UKismetMathLibrary::Multiply_VectorFloat(
//                                     Velocity, timeToTravel));
//           }
//           FVector fDir =
//               UKismetMathLibrary::Subtract_VectorVector(target_aim_pos, start);
//           FRotator sex = UKismetMathLibrary::Conv_VectorToRotator(fDir);
//           rot = sex;
//         }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }
if (g_Memory.triggerbot) {
  auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
  if ((int)propSlot.GetValue() >= 1 &&
      (int)propSlot.GetValue() <= 3) {

    auto CurrentWeaponReplicated =
        (ASTExtraShootWeapon *)
            WeaponManagerComponent->CurrentWeaponReplicated;
    if (CurrentWeaponReplicated) {

      int AmmoInClip =
          CurrentWeaponReplicated->GetCurrentBulletNumInClip();
      if (AmmoInClip > 0) {
        FVector ssss;

        ASTExtraPlayerCharacter *Target = GetTargetByCrossDist(ssss);
        if (Target && !(ssss.X == 0.0f && ssss.Y == 0.0f && ssss.Z == 0.0f)) {
          localPlayer->HandleStartFireDelegate((ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated);
          localPlayer->EnterFire();
          localPlayerController->StartFire(2);
          localPlayerController->OnPressFire();
        } else {
          g_Memory.startedfirenig = true;
        }
      }
    }
  }
}
if (preferences.Config.SilentAim.Enable) {
    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
        if ((int) propSlot.GetValue() >= 1 && (int) propSlot.GetValue() <= 3) {
            auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
            if (CurrentWeaponReplicated) {
                auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                if (ShootWeaponComponent) {
                
                    int shoot_event_idx = 168;
                    auto VTable = (void **) ShootWeaponComponent->VTable;
                    if (VTable && (VTable[shoot_event_idx] != shoot_event)) {
                        orig_shoot_event = decltype(orig_shoot_event)(
                                VTable[shoot_event_idx]);
                        VTable[shoot_event_idx] = (void *) shoot_event;
                    }
                }
            }
        }
    }
}

                if (preferences.Config.SilentAim.Enable){
                DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.SilentAim.Cross, 100, COLOR_WHITE);
                    }
                    if (preferences.Config.SilentAim.AimBot){
                DrawCircle(HUD, ScreenWidth/2, ScreenHeight/2, preferences.Config.Aimbot.Cross, 100, COLOR_WHITE);
                    }
            int totalEnemies = 0, totalBots = 0;
               int enemycount6 = totalEnemies + totalBots;
            std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
            GetAllActors(PlayerCharacter);
            for (auto actor = PlayerCharacter.begin();
                 actor != PlayerCharacter.end(); actor++) {
              auto Player = *actor;
// if (g_Memory.DamageFix)
// {
//   Player->SetActorScale3D({2.f,1.f,2.f});
// }
              if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;

              if (Player->TeamID == localPlayer->TeamID)
                continue;

              if (Player->bDead)
                continue;

              if (Player->bHidden)
                continue;

              if (!Player->RootComponent)
                continue;

              if (GlobalConfig.ESPMenu.IgnoreBot) {
                if (Player->bEnsure)
                  continue;
              }

              if (Player->bEnsure)
                totalBots++;
              else
                totalEnemies++;

              FVector Head = GetBoneLocationByName(Player, "Head");
              if ( DamageFix )
              {
              localPlayerController->LocalMoveTo(Head);
}
              FVector HeadZZ = GetBoneLocationByName(Player, "Head");
              HeadZZ.Z += 12.5f;
              FVector Root = GetBoneLocationByName(Player, "Root");
              FVector upper_r = GetBoneLocationByName(Player, "upperarm_r");
              FVector lowerarm_r = GetBoneLocationByName(Player, "lowerarm_r");
              FVector hand_r = GetBoneLocationByName(Player, "hand_r");
              FVector upper_l = GetBoneLocationByName(Player, "upperarm_l");
              FVector lowerarm_l = GetBoneLocationByName(Player, "lowerarm_l");
              FVector hand_l = GetBoneLocationByName(Player, "hand_l");
              FVector thigh_l = GetBoneLocationByName(Player, "thigh_l");
              FVector calf_l = GetBoneLocationByName(Player, "calf_l");
              FVector foot_l = GetBoneLocationByName(Player, "foot_l");
              FVector thigh_r = GetBoneLocationByName(Player, "thigh_r");
              FVector calf_r = GetBoneLocationByName(Player, "calf_r");
              FVector foot_r = GetBoneLocationByName(Player, "foot_r");
              FVector neck_01 = GetBoneLocationByName(Player, "neck_01");
              FVector pelvis = GetBoneLocationByName(Player, "pelvis");

              float Distance = Player->GetDistanceTo(localPlayer) / 100.f;
              if (Distance < 500.f) {
                auto CameraCache =
                    g_PlayerController->PlayerCameraManager->CameraCache;
                FVector2D HeadZc;
                HeadZc = WorldToScreen(Head, CameraCache.POV, ScreenWidth,
                                       ScreenHeight);
                float adjustedY6;

                if (GlobalConfig.ESPMenu.Name && GlobalConfig.ESPMenu.Health) {
                  adjustedY6 = HeadZc.Y - 50;
                } else if (GlobalConfig.ESPMenu.Health) {
                  adjustedY6 = HeadZc.Y - 25;
                } else if (GlobalConfig.ESPMenu.Name) {
                  adjustedY6 = HeadZc.Y - 25;
                } else {
                  adjustedY6 = HeadZc.Y;
                }
                FVector head_pos = Player->GetBonePos("Head", {});

                FVector2D startPosition = {static_cast<float>(ScreenWidth / 2),
                                           140};
                FVector2D endPosition = {HeadZc.X, adjustedY6};

                FLinearColor lineColor;
                if (line_trace_single(GetFullWorld(), CameraCache.POV.Location,
                                      head_pos)) {
                  lineColor = COLOR_PURPLE;
                } else {
                  lineColor = COLOR_WHITE;
                }
                 if (GlobalConfig.ESPMenu.Line) {
                  DrawLine(HUD, startPosition, endPosition, 1.5f, lineColor);

                  if (Player->bEnsure) {
                    DrawLine(HUD, startPosition, endPosition, 1.5f, lineColor);
                  }
                }

                FVector2D HeadSc, NeckSc, RootSc, upper_rPoSC, lowerarm_rPoSC,
                    hand_rPoSC, upper_lPoSC, hand_lPoSC, thigh_lPoSC,
                    calf_lPoSC, foot_lPoSC, thigh_rPoSC, calf_rPoSC, foot_rPoSC,
                    neck_01PoSC, pelvisPoSC, lowerarm_lSC;
                if (gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, Head, false, &HeadSc) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, HeadZZ, false, &NeckSc) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, upper_r, false, &upper_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, upper_l, false, &upper_lPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, lowerarm_r, false,
                        &lowerarm_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, hand_r, false, &hand_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, lowerarm_l, false,
                        &lowerarm_lSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, hand_l, false, &hand_lPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, thigh_l, false, &thigh_lPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, calf_l, false, &calf_lPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, foot_l, false, &foot_lPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, thigh_r, false, &thigh_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, calf_r, false, &calf_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, foot_r, false, &foot_rPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, neck_01, false, &neck_01PoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, pelvis, false, &pelvisPoSC) &&
                    gGameplayStatics->ProjectWorldToScreen(
                        localPlayerController, Root, false, &RootSc)) {

                  bool IsVisible = localPlayerController->LineOfSightTo(
                      Player, {0, 0, 0}, true);
                  FLinearColor Color = {1.0f, 0, 0, 1.0f};
                  if (IsVisible)
                    Color = {0, 1.0f, 0, 1.0f};

                  if (GlobalConfig.ESPMenu.Skeleton) {
                    static vector<string> right_arm{"neck_01",    "clavicle_r",
                                                    "upperarm_r", "lowerarm_r",
                                                    "hand_r",     "item_r"};
                    static vector<string> left_arm{"neck_01",    "clavicle_l",
                                                   "upperarm_l", "lowerarm_l",
                                                   "hand_l",     "item_l"};
                    static vector<string> spine{"Head",     "neck_01",
                                                "spine_03", "spine_02",
                                                "spine_01", "pelvis"};
                    static vector<string> lower_right{"pelvis", "thigh_r",
                                                      "calf_r", "foot_r"};
                    static vector<string> lower_left{"pelvis", "thigh_l",
                                                     "calf_l", "foot_l"};
                    static vector<vector<string>> skeleton{
                        spine, right_arm, left_arm, lower_right, lower_left};

                    for (auto &boneStructure : skeleton) {
                      string lastBone;
                      for (const string &currentBone : boneStructure) {
                        if (!lastBone.empty()) {
                          FVector wBoneFrom =
                              GetBoneLocationByName(Player, lastBone.c_str());
                          FVector wBoneTo = GetBoneLocationByName(
                              Player, currentBone.c_str());
                          FVector2D boneFrom, boneTo;
                          if (gGameplayStatics->ProjectWorldToScreen(
                                  localPlayerController, wBoneFrom, false,
                                  &boneFrom) &&
                              gGameplayStatics->ProjectWorldToScreen(
                                  localPlayerController, wBoneTo, false,
                                  &boneTo)) {

                            bool IsVisible = g_PlayerController->LineOfSightTo(
                                g_PlayerController->PlayerCameraManager,
                                Player->GetBonePos(currentBone.c_str(), {}),
                                true);

                            FLinearColor color;
                            if (IsVisible) {
                              color =
                                  Player->bEnsure ? COLOR_WHITE : COLOR_PURPLE;
                            } else {
                              color =
                                  Player->bEnsure ? COLOR_PURPLE : COLOR_WHITE;
                            }

                            DrawLine(HUD, boneFrom, boneTo, EspSktonThik,
                                     color);
                          }
                        }
                        lastBone = currentBone;
                      }
                    }
                  }

                  if (GlobalConfig.ESPMenu.Box) {
                    float boxHeight = abs(NeckSc.Y - RootSc.Y);
                    float boxWidth = boxHeight * 0.65f;
                    FVector2D vBox =
                        FVector2D(NeckSc.X - (boxWidth / 2), NeckSc.Y);
                    Box4Line(HUD, 1.5f, vBox.X, vBox.Y, boxWidth, boxHeight,
                             COLOR_WHITE);
                  }

                  if (GlobalConfig.ESPMenu.Health) {
                    int CurHP =
                        (int)std::max(0, std::min((int)Player->Health,
                                                  (int)Player->HealthMax));
                    int MaxHP = (int)Player->HealthMax;

                    if (Player->Health == 0.0f && !Player->bDead) {
                      CurHP = Player->NearDeathBreath;
                      if (Player->NearDeatchComponent) {
                        MaxHP = Player->NearDeatchComponent->BreathMax;
                      }
                    }

                    auto mWidth = 80.0f;
                    auto mHeight = 10.0f;
                    NeckSc.X -= (mWidth / 2);
                    HeadSc.Y -= (mHeight * 1.5f);
                    DrawFilledRectangle(HUD, {NeckSc.X, NeckSc.Y - 10}, mWidth,
                                        mHeight, {0.0f, 0.0f, 0.0f, 0.5f});

                    DrawFilledRectangle(HUD, {NeckSc.X, NeckSc.Y - 10},
                                        (CurHP * mWidth / MaxHP), mHeight,
                                        {1.0f, 1.0f, 1.0f, 1.f});
                  }

                  if (GlobalConfig.ESPMenu.Weapon) {

                    auto WeaponManagerComponent =
                        Player->WeaponManagerComponent;
                    if (WeaponManagerComponent) {
                      {
                        auto CurrentWeaponReplicated =
                            (ASTExtraShootWeapon *)
                                WeaponManagerComponent->CurrentWeaponReplicated;
                        if (CurrentWeaponReplicated) {
                          auto WeaponId =
                              (int)CurrentWeaponReplicated->GetWeaponID();
                          if (WeaponId) {

                            std::wstring s;
                            s += CurrentWeaponReplicated->GetWeaponName()
                                     .ToWString();
                            robotoFont->LegacyFontSize = 10.0f;
                            DrawText(
                                HUD, FString(s),
                                FVector2D(RootSc.X, (NeckSc.Y - 41)),
                                FLinearColor(1.0, 0.4980392156862745, 0.0, 1.0),
                                true);
                          }
                        }
                      }
                    }
                  }

                  if (GlobalConfig.ESPMenu.Name) {
                    robotoFont->LegacyFontSize = 14.f;
                    std::wstring knockedstr = L"[ KNOCKED ]";

                    std::wstring Text;
                    std::wstring ai = L"BOT";

                    Text = Player->PlayerName.ToWString();

                    if (Player->Health <= 0) {
                      if (Player->bEnsure) {
                        DrawText(HUD, FString(knockedstr),
                                 FVector2D(RootSc.X, (RootSc.Y + 3)),
                                 COLOR_PLAYER, true);
                      } else {
                        DrawText(HUD, FString(knockedstr),
                                 FVector2D(RootSc.X, (RootSc.Y + 3)),
                                 FLinearColor(255 / 255.0f, 0 / 255.0f,
                                              0 / 255.0f, 1.0f),
                                 true);
                      }
                    } else {
                      float adjustedY =
                          GlobalConfig.ESPMenu.Health ? (NeckSc.Y - 15) : (NeckSc.Y);

                      if (!Player->bEnsure) {
                        DrawText(HUD, FString(Text),
                                 FVector2D(HeadSc.X, adjustedY), COLOR_WHITE,
                                 true);
                      } else {
                        DrawText(HUD, FString(ai),
                                 FVector2D(HeadSc.X, adjustedY), COLOR_WHITE,
                                 true);
                      }
                    }
                  }
                  if (GlobalConfig.ESPMenu.Distance) {
                    std::wstring distance;
                    distance = std::to_wstring((int)Distance) + L" M";
                    robotoFont->LegacyFontSize = 11.f;
                    DrawText(HUD, FString(distance),
                             FVector2D(RootSc.X, (RootSc.Y + 17)), COLOR_WHITE,
                             true);
                  }
                }
              }
            }

            if (totalEnemies > 0 || totalBots > 0) {

                        g_Memory.enemies = totalEnemies;
                        g_Memory.bots = totalBots;
               g_Memory.totalEnemiesAndBots = totalEnemies + totalBots;
              std::wstring numi =
                  L"[" + std::to_wstring(g_Memory.totalEnemiesAndBots) + L"]";

            }
          }
        }
      }
      g_LocalPlayer = localPlayer;
      g_PlayerController = localPlayerController;
    }
  }
}
void *(*oProcessEvent)(UObject *pObj, UFunction *pFunc, void *pArgs);
void *hkProcessEvent(UObject *pObj, UFunction *pFunc, void *pArgs) {
  if (pFunc) {
    if (pFunc->GetFullName() == ("Function Engine.HUD.ReceiveDrawHUD")) {
      AHUD *pHUD = (AHUD *)pObj;
      if (pHUD) {
        auto Params = (AHUD_ReceiveDrawHUD_Params *)pArgs;
        if (Params) {

          RenderESP(pHUD, Params->SizeX, Params->SizeY);
          screenWidth = Params->SizeX;
          screenHeight = Params->SizeY;
        }
      }
    }
  }

  return oProcessEvent(pObj, pFunc, pArgs);
}

void *RTL_language() {


  auto MAIN = (FUObjectArray *)(obbbbl());
  auto gobjects = MAIN->ObjObjects;
  for (int i = 0; i < gobjects.Num(); i++)
    if (auto obj = gobjects.GetByIndex(i)) {

      if (obj->IsA(AHUD::StaticClass())) {
        auto HUD = (AHUD *)obj;
        int its = 75;
        auto VTable = (void **)HUD->VTable;
        if (VTable && (VTable[its] != hkProcessEvent)) {
          oProcessEvent = decltype(oProcessEvent)(VTable[its]);
          VTable[its] = (void *)hkProcessEvent;
        }
      }
      if (obj->IsA(ASTExtraPlayerController::StaticClass())) {
        auto HUD = (ASTExtraPlayerController *)obj;
        int its = 75;
        auto VTable = (void **)HUD->VTable;
        if (VTable && (VTable[its] != hkProcessEvent)) {
          oProcessEvent = decltype(oProcessEvent)(VTable[its]);
          VTable[its] = (void *)hkProcessEvent;
        }
      }
    }
  return 0;
}

#define hook GaYSSS9aAL

#define hook GaYSSS9aAL

+ (void)load {
  FName::GNames = GetGNames();
  while (!FName::GNames) {
    FName::GNames = GetGNames();
    sleep(1);
  }

  UObject::GUObjectArray = (FUObjectArray *)(obbbbl());

  while (!UObject::GUObjectArray) {
    UObject::GUObjectArray = (FUObjectArray *)(obbbbl());
    sleep(1);
  }

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
                   [self load1];
                 });
}
+ (void)load1 {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
                   RTL_language();
                 });
}
__attribute__((constructor)) void _init() {
    pthread_t t;
}
@end
