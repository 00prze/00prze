#pragma once
class Config {
public:
    struct sESPMenu {
        bool Line = false;
        bool Box = false;
        bool Skeleton = false;
        bool Health = false;
        bool Name = false;
        bool Distance = false;
        bool TeamID = false;
        bool Weapon = false;
        bool Alert = false;
        bool Vehicle = false;
        bool IgnoreBot = false;
        bool LootBox = false;
        bool Throwables = false;
    } ESPMenu;
};
namespace Memory00 {
inline bool prze66;
}
extern Config GlobalConfig;
struct Memory {
    // Public boolean variables
    bool fps120;
    bool pidor;
    bool sigma = false;
    bool przeware = false;
    bool przeware1 = true;
    bool przeware2;
    bool fastreload;
    bool nosmoke;
    bool autojump;
    bool nofog;
    bool pastafly;
    bool Snow;
    bool Rain;
    bool Blizzard;
    bool PlayerDance2;
    bool animbreak;
    bool bHit;
    bool visible = false;
    bool FlyCar;
    bool DamageFix;
    bool XHIT666;
    bool AirControl666;
    bool magicpidor;
    bool MaxAcceleration666;
    bool CustomTimeDilation666;
    bool visible666;
    bool bVizhu;
    bool disablecol;
    bool flyatenemy;
    bool action0;
    bool action1;
    bool action2;
    bool action3;
    bool action4;
    bool action5;
    bool action6;
    bool actionstop;
    bool disablegrav;
    bool ShowDamage;
    bool crazycar;
    bool bunnyhop;
    bool GlacierEffect;
    bool AutoParachute;
    bool rapidfire;
    bool smallcross;
    bool InstantHit2;
    bool InstantHit1;
    bool SpeedKnock;
    bool PlayerDance;
    bool isEnabled;
    bool gaotiao;
    float ass;
    bool zhuiluo;
    bool isStatic;
    bool isJitter;
    bool isSpin;
    bool NoGravity;
    bool WeaponScale;
    bool Norecoil;
    bool anti1 = false;
    bool anti2 = false;
    bool anti3 = false;
    bool епта;
    bool тристашисят = false;
    bool anti4 = false;
    bool startedfirenig;
    bool Blacksky;
    bool triggerbot;
    bool giamgiat = false;
    bool InstantHit;
    bool init1 = false;
    bool init2 = false;
    bool init3 = false;
    bool init4 = false;
    bool init5 = false;
    bool WideView = false;
float CurRotYaw;
float CurRotPitch;
float CurRotRoll;
bool vis666;
int totalEnemiesAndBots;
       int bots;
         int enemies;
    // Public float variables
    float pidor55;
    float pidor66;
    float hit_size;
    float pidorasinax;
    float pidorasinaz;
    float DanceValue;
    float bfc;
    float hit_size2;
    float hit_size3;
    float hit_size4;
    float flycarspeed = 130.f;
    float spinYawOffset;
    float spinPitchOffset;
    float staticYawOffset;
    float staticPitchOffset;
    float jitterInterval;
    float jitterYawOffset1;
    float jitterYawOffset2;
    float jitterPitchOffset1;
    float jitterPitchOffset2;
    float WeaponScaleChangerX = 1;
    float WeaponScaleChangerY = 1;
    float WeaponScaleChangerZ = 1;
    float WeaponRelativeLocX = 1;
    float WeaponRelativeLocY = 1;
    float WeaponRelativeLocZ = 1;
    float WeaponRelativeRotX = 1;
    float WeaponRelativeRotY = 1;
    float WeaponRelativeRotZ = 1;
float g_disstance = 500.f;


    float chinazes1;
    float chinazes2;
    float chinazes3;
    float headSize;
    float pidor666 = -0.599;
    float pidor6661 = 0.f;

    // Public integer variables
    int combo_rn555 = 0;
    int WideValue = 120;
};

// Create a global instance of Memory struct (optional)
extern Memory g_Memory;
struct JsonPreferences {
    // Перечисление для целей прицеливания
    enum EAimTarget {
        Auto = 0,
        Chest = 1,
        Head = 2
    };

    // Перечисление для триггеров прицеливания
    enum EAimTrigger {
        None = 0,
        Shooting = 1,
        Scoping = 2,
        Both = 3,
        Any = 4
    };

    // Перечисление для приоритетов прицеливания
    enum EAimPriority {
        DistancePriority = 0,
        FOVPriority = 1
    };

    // Вложенная структура для меню прицеливания
    struct sAimMenu {
        bool EnableAllHack;
        bool Enable;
        bool Autofire;
        bool AimBot;
        bool CameraCache;
        EAimTarget Target;
        EAimTrigger Trigger;
        EAimPriority Priority;
        bool IgnoreKnocked;
        bool IgnoreBot;
        bool Prediction;
        bool VisCheck;
        bool LessRecoil;
        bool InstantHit;
        bool FastShoot;
        bool HeadShoot;
        bool ReCo;
        float Recc = 1.0f;
        bool HitX;
        int Cross = 0;
        bool test5;
        bool SpeedHack;
    };
    struct AimMenu {
        bool EnableAllHack;
        bool Enable;
        bool Autofire;
        bool AimBot;
        bool CameraCache;
        EAimTarget Target;
        EAimTrigger Trigger;
        EAimPriority Priority;
        bool IgnoreKnocked;
        bool IgnoreBot;
        bool Prediction;
        bool VisCheck;
        bool LessRecoil;
        bool InstantHit;
        bool FastShoot;
        bool HeadShoot;
        bool ReCo;
        float Recc = 1.0f;
        bool HitX;
        int Cross = 0;
        bool test5;
        bool SpeedHack;
    };

    // Основная структура конфигурации
    struct sConfig {
        sAimMenu SilentAim{false};  
        AimMenu Aimbot{false};// Инициализация по умолчанию
    };

    sConfig Config{false};  // Инициализация конфигурации
};

// Объявление глобальной переменной
extern JsonPreferences preferences;