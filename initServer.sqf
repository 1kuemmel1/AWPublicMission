/*
Author: SENSEI

Last modified: 8/5/2015
__________________________________________________________________*/
SEN_debug = (paramsArray select 1) isEqualTo 1;

if !(getMarkerColor "SEN_med_mrk" isEqualTo "") then {
    _med = ["Land_Hospital_main_F", "Land_Hospital_side2_F", "Land_Hospital_side1_F", "Land_Medevac_house_V1_F", "Land_Medevac_HQ_V1_F"];
    {
        if ((typeOf _x) in _med) then {_x setvariable["ace_medical_isMedicalFacility", true, true]};
        nil
    } count ((getMarkerPos "SEN_med_mrk") nearObjects ["House", 100]);
};

[["SEN_approvalCiv", "JK_TicketSystem", "SEN_ClearedCitys"], {
    if !(isServer) exitWith {};
    params ["_key", "_value", "", "_preValue"];
    if ("JK_TicketSystem" == _key) then {
        if (_value > _preValue) then {
            ["SEN_ticketAdd",[floor(_value - _preValue)]] remoteExecCall ["BIS_fnc_showNotification", 0, false];
        } else {
            ["SEN_ticketSubstact",[floor(_preValue - _value)]] remoteExecCall ["BIS_fnc_showNotification", 0, false];
        };
    };
    if ("SEN_approvalCiv" == _key) then {
        if (_value > _preValue) then {
            ["SEN_approvalBonus",[floor(_value - _preValue)]] remoteExecCall ["BIS_fnc_showNotification", 0, false];
        };
    };
    [_key, str _value] spawn db_fnc_save;
}] call JK_Core_fnc_addVariableEventHandler;

[] spawn {
    waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};
    "JK_registerPlayer" addPublicVariableEventHandler {
        params ["" ,"_player"];
        private _owner = owner _player;
        {
            _owner publicVariableClient _x;
        } count ["JK_TicketSystem", "SEN_approvalCiv", "predefinedLocations", "iedInitialArray", "JK_iedTown", "JK_VSS_ListTickets", "JK_IED"];
    };
};
