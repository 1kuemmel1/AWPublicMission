/*
unit loadout script by joko
Idea by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set JK_primaryweaponAmmo to 0 and add those
magazines one for one in JK_items.
*/

//clothing - (string)
JK_uniforms = ["U_B_Wetsuit"];
JK_vests = ["V_RebreatherB"];
JK_headgears = [""];
JK_backpacks = ["B_Kitbag_rgr"];
JK_insignium = [""];
JK_useProfileGoggles = 0;        //If set to 1, goggles from your profile will be used. If set to 0, JK_goggles will be added (or profile goggles will be removed when JK_goggles is left empty).
JK_goggles = "G_B_Diving";

//weapons - primary weapon - (string)
JK_primaryweapon = ["rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_grip", "rhs_weap_m4a1_carryhandle_grip2", "rhs_weap_m4a1_carryhandle_grip", "rhs_weap_m4a1_carryhandle_pmag", "rhs_weap_m4a1", "rhs_weap_m4a1_grip2"];
//primary weapon items - (array)
JK_itemsPrimaryweapon = ["rhsusf_acc_compm4","rhsusf_acc_anpeq15side","",["rhsusf_acc_nt4_black","rhsusf_acc_rotex5_grey"]];

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
JK_ARhandle = 0;        //should stay 0. Determines the class of ammunition for BIS_fnc_addWeapon. Specific Rifles need specific JK_ARhandles. Test it out.
JK_primaryweaponAmmo = 6;
JK_primaryweaponTracers = 2;

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
JK_handgun = "rhsusf_weap_m1911a1";

//handgun items - (array)
JK_itemsHandgun = [];

//handgun ammo (if a handgun is given) - (integer)
JK_handgunAmmo = 3;

//weapons - launcher - (string)
JK_launcher = "";
JK_launcherHandle = 0;    //should stay the way it is. Determines the class of ammunition for BIS_fnc_addWeapon. Specific launchers need specific JK_launcherHandle. Test it out.
JK_launcherItems = [];

//launcher ammo (if a launcher is given) - (integer)
JK_launcherAmmo = 0;

//binocular - (string)
JK_binocular = "ACE_Vector";

//throwables - (integer)
JK_grenadeHE = 2;
JK_grenadeSmokeWhite = 3;
JK_grenadeSmokeYellow = 0;
JK_grenadeSmokeOrange = 0;
JK_grenadeSmokeRed = 2;
JK_grenadeSmokePurple = 1;
JK_grenadeSmokeBlue = 1;
JK_grenadeSmokeGreen = 2;
JK_chemlightYellow = 1;
JK_chemlightRed = 1;
JK_chemlightGreen = 1;
JK_chemlightBlue = 1;
JK_IRgrenade = 1;

//ACE Items
JK_IVBagSaline250 = 0;
JK_IVBagSaline500 = 0;
JK_IVBagSaline1000 = 1;
JK_epinephrine = 15;
JK_morphine = 15;
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
        "ACE_NVG_Wide",
        "ItemMap",
        "ItemGPS"
        ];

//items added to any container - (array)
JK_items = ["ACRE_PRC343","ACE_Flashlight_MX991","ACE_MapTools","ACE_CableTie","ACE_microDAGR","ACE_DAGR","ACE_Banana"];

JK_medicClass = 1;
JK_spawnAllowed = false;
JK_isEngineer = 0;
JK_isPilot = false;

//Vehicle Spawn System
JK_VehClass = "All";

///// No editing necessary below this line /////
_this call jk_loadOut_fnc_gear;
