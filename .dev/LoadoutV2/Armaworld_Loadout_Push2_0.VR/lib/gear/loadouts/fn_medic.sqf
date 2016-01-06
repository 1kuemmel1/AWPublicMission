/*
unit loadout script by joko
Idea by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set JK_primaryweaponAmmo to 0 and add those
magazines one for one in JK_items.
*/

//clothing - (string)
JK_uniforms = ["Scorpion_TS_Camo_SS","Scorpion_TS_Camo","Scorpion_TP_Camo_SS","Scorpion_TP_Camo","Scorpion_Camo_SS","Scorpion_GS_Camo_SS","Scorpion_GS_Camo","Scorpion_GP_Camo_SS","Scorpion_GP_Camo","Scorpion_Camo_Cyre","Scorpion_Camo_Cyre_TS","Scorpion_Camo_Cyre_TP","Scorpion_Camo_Cyre_Tee","Scorpion_Camo_Cyre_GS","Scorpion_Camo_Cyre_GP","Scorpion_Camo","OGA_Camo_SS","OGA_GS_Camo_SS","OGA_GS_Camo","OGA_GP_Camo_SS","OGA_GP_Camo","OGA_G_Camo_SS","OGA_G_Camo","OGA_Camo","MC_TS_Camo_SS","MC_TS_Camo","MC_TP_Camo_SS","MC_TP_Camo","MC_Camo_SS","MC_GS_Camo_SS","MC_GS_Camo","MC_GP_Camo_SS","MC_GP_Camo","MC_Camo_Cyre","MC_Camo_Cyre_TS","MC_Camo_Cyre_TP","MC_Camo_Cyre_Tee","MC_Camo_Cyre_GS","MC_Camo_Cyre_GP","MC_Camo","MarPat_Camo_SS","MarPat_GS_Camo_SS","MarPat_GS_Camo","MarPat_GP_Camo_SS","MarPat_GP_Camo","MarPat_TS_Camo_SS","MarPat_TS_Camo","MarPat_Camo_Cyre","MarPat_Camo_Cyre_Tee","MarPat_Camo_Cyre_GS","MarPat_Camo_Cyre_GP","MarPat_Camo_Cyre_TS","MarPat_Camo_Cyre_TP","MarPat_TP_Camo_SS","MarPat_TP_Camo","MarPat_Camo","M90_TS_Camo_SS","M90_TS_Camo","M90_TP_Camo_SS","M90_TP_Camo","M90_Camo_SS","M90_GS_Camo_SS","M90_GS_Camo","M90_GP_Camo_SS","M90_GP_Camo","M90_Camo_Cyre","M90_Camo_Cyre_TS","M90_Camo_Cyre_TP","M90_Camo_Cyre_Tee","M90_Camo_Cyre_GS","M90_Camo_Cyre_GP","M90_Camo","DualTex_TS_Camo_SS","DualTex_TS_Camo","DualTex_TP_Camo_SS","DualTex_TP_Camo","DualTex_Camo_TShirt","DualTex_Camo_SS","DualTex_GS_Camo_SS","DualTex_GS_Camo","DualTex_GP_Camo_SS","DualTex_GP_Camo","DualTex_Camo_Cyre","DualTex_Camo_Cyre_TS","DualTex_Camo_Cyre_TP","DualTex_Camo_Cyre_Tee","DualTex_Camo_Cyre_GS","DualTex_Camo_Cyre_GP"];
JK_vests = ["AOR1_Vest_5","AOR1_Vest_4","AOR1_Vest_3","AOR1_Vest_1","AOR1_Vest_2","OGA_Vest_1","OGA_Vest_2"];
JK_headgears = ["AOR1_Helmet1","AOR1_Helmet2","AORU_Helmet1","AORU_Helmet2"];
JK_backpacks = ["AOR1_Backpack_Kitbag"];
JK_insignium = ["111thID","TFAegis","GryffinRegiment",""];
JK_useProfileGoggles = 0;        //If set to 1, goggles from your profile will be used. If set to 0, JK_goggles will be added (or profile goggles will be removed when JK_goggles is left empty).
JK_goggles = "G_Aviator";

//weapons - primary weapon - (string)
JK_primaryweapon = ["RH_M4_ris_m","RH_M4A6"];

//primary weapon items - (array)
JK_itemsPrimaryweapon = ["RH_ta31rmr_tan","RH_ta31rco_tan"];

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
JK_ARhandle = 0;        //should stay 0. Determines the class of ammunition for BIS_fnc_addWeapon. Specific Rifles need specific JK_ARhandles. Test it out.
JK_primaryweaponAmmo = 6;
JK_primaryweaponTracers = 0;

//40mm Grenades - (integer)
JK_40mmHeGrenadesAmmo = 0;
JK_40mmSmokeGrenadesWhite = 0;
JK_40mmSmokeGrenadesYellow = 0;
JK_40mmSmokeGrenadesOrange = 0;
JK_40mmSmokeGrenadesRed = 0;
JK_40mmSmokeGrenadesPurple = 0;
JK_40mmSmokeGrenadesBlue = 0;
JK_40mmSmokeGrenadesGreen = 0;
JK_40mmFlareWhite = 0;
JK_40mmFlareYellow = 0;
JK_40mmFlareRed = 0;
JK_40mmFlareGreen = 0;
JK_40mmFlareIR = 0;

//weapons - handgun - (string)
JK_handgun = "hgun_Pistol_heavy_01_F";

//handgun items - (array)
JK_itemsHandgun = [""];

//handgun ammo (if a handgun is given) - (integer)
JK_handgunAmmo = 3;

//weapons - launcher - (string)
JK_launcher = "";
JK_launcherHandle = 0;    //should stay the way it is. Determines the class of ammunition for BIS_fnc_addWeapon. Specific launchers need specific JK_launcherHandle. Test it out.
JK_launcherItems = [];

//launcher ammo (if a launcher is given) - (integer)
JK_launcherAmmo = 0;

//binocular - (string)
JK_binocular = "Binocular";

//throwables - (integer)
JK_grenadeHE = 0;
JK_grenadeSmokeWhite = 4;
JK_grenadeSmokeYellow = 0;
JK_grenadeSmokeOrange = 0;
JK_grenadeSmokeRed = 0;
JK_grenadeSmokePurple = 1;
JK_grenadeSmokeBlue = 0;
JK_grenadeSmokeGreen = 1;
JK_chemlightYellow = 0;
JK_chemlightRed = 0;
JK_chemlightGreen = 0;
JK_chemlightBlue = 0;
JK_IRgrenade = 0;

//ACE Items
JK_IVBagSaline250 = 1;
JK_IVBagSaline500 = 0;
JK_IVBagSaline1000 = 8;
JK_epinephrine = 10;
JK_morphine = 10;
JK_atropine = 0;

JK_fieldDressing = 30;
JK_packingBandage = 0;
JK_elasticBandage = 0;
JK_quikclot = 0;
JK_tourniquet = 0;

JK_earPlugs = 1;
JK_swapBarrel = 0;

//first aid kits and medi kits- (integer)
JK_FirstAidKits = 0;
JK_MediKit = 0;        //if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
JK_itemsUniform = [];

//items added specifically to vest: - (array)
JK_itemsVest = [];

//items added specifically to Backpack: - (array)
JK_itemsBackpack = [];

//linked items - (array)
JK_itemsLink = [
        "ItemWatch",
        "ItemCompass",
        "ItemMap",
        "ItemGPS",
        "ACE_NVG_Wide"
        ];

//items added to any container - (array)
JK_items = ["ACRE_PRC343","ACE_Flashlight_MX991","ACE_MapTools","ACE_CableTie","ACE_microDAGR","ACE_HuntIR_monitor"];

JK_medicClass = 1;
JK_spawnAllowed = true;
JK_isEngineer = 2;
JK_isPilot = true;

//Vehicle Spawn System
JK_VehClass = "medic";

///// No editing necessary below this line /////
_this call jk_loadOut_fnc_gear;