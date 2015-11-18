/*
Author: joko // Jonas


Description: spawns Aggressive Civilan

             returns nothing
__________________________________________________________________*/
private ["_grp", "_targets", "_targetPlayer"];
params ["_unit", "_range"];
_grp = [getPos _unit ,0,floor (random 3), RESISTANCE] call SEN_fnc_spawnGroup;
_grp = [units _grp] call SEN_fnc_setSide;
deleteVehicle _unit;
_unit = leader _grp;
_unit forceSpeed (_unit getSpeed "FAST");
_unit allowfleeing 0;
_targets = [(getPosATL _unit),_range] call SEN_fnc_getNearPlayers;
_unit setVariable ["JK_isBomber", true, true];
_unit setBehaviour "COMBAT";
_unit enableAI "FSM";
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit enableAI "AIMINGERROR";
_unit enableAI "SUPPRESSION";
if (count _targets isEqualTo 0) exitWith {[1,"No players near Aggressive Civilian."] call SEN_fnc_log};

_targetPlayer = _targets call BIS_fnc_selectRandom;

{
    _unit reveal _x;
    nil
} count _targets;

[0,"Aggressive Civilian target is %1.",name _targetPlayer] call SEN_fnc_log;

[_unit, _targetPlayer, _grp] spawn {
    params ["_unit", "_targetPlayer", "_grp"];
    _wp = _grp addWaypoint [getPos _targetPlayer, 0];
    _wp setWaypointType "SAD";
    _wp setWaypointSpeed "FULL";
    _wp setWaypointCombatMode "RED";
    while {alive _unit} do {
        if (_targetPlayer getVariable ["ACE_isUnconscious", false] || !alive _targetPlayer) then {
            private "_targets";
            _targets = [(getPosATL _unit),_range] call SEN_fnc_getNearPlayers;
            _targetPlayer = _targets call BIS_fnc_selectRandom;
        };
        _wp setWaypointPosition [getPos _targetPlayer, 10];
        sleep 60;
    };
};