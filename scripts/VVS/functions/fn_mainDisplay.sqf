/*
    File: fn_mainDisplay.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for the VVS Menu Display. Handles filters and more.
*/
private["_mode","_control","_row","_vehicleList","_checkBox"];
disableSerialization;
waitUntil{!(isNull (findDisplay 38100))};
if(isNil "VVS_Cfg") then{_mode = "All";} else {_mode = VVS_Cfg};

_control = ((findDisplay 38100) displayCtrl 38101);
if ((lnbSize 38101) select 0 > -1) then {
    lnbClear _control;
};

//Fill out the filter menu.
if(_mode isEqualTo "All") then {
    {
        lbAdd[38102,_x];
        lbSetData[38102,(lbSize 38102)-1,_x];
    } foreach JK_allVVSVars;

    lbSetCurSel[38102,0];
} else {
    ctrlShow[38102,false]; //Hide it.
    _vehicleList = (JK_allVVSVars select (JK_allVVSNames find _mode));
    if(_vehicleList isEqualTo []) exitWith {hintSilent "You dont have any Vehicle you can Spawn!"; 38100 closeDisplay 0;};

    {
        private ["_cfgInfo", "_costs"];
        _cfgInfo = [_x] call VVS_fnc_cfgInfo;
        _costs = format ["%1 Tickets" , _x select 1];
        _control lnbAddRow ["",_costs];
        if !((_cfgInfo select 2) isEqualTo "pictureThing") then {
            _control lnbSetPicture [[_forEachIndex, 0], _cfgInfo select 1];
        };
        _control lnbSetData[[_forEachIndex, 0], (_cfgInfo select 0)]; //Set the displayName to index/column 1
    } foreach _vehicleList;
};
