/*
Author: SENSEI

Last modified: 8/12/2015

Description: spawns group

        returns group or array
__________________________________________________________________*/
private ["_setSkill", "_grp","_driverArray","_unitPool","_vehPool","_airPool","_veh","_unit"];

params [["_Opos",[0,0,0],[[]]], ["_type",0,[0]], ["_count",1,[0]], ["_side",SEN_enemySide], ["_uncache",false]];
_setSkill = !(_side in [WEST, CIVILIAN]);

switch _side do {
    case WEST: {_unitPool = SEN_unitPoolWest; _vehPool = SEN_vehPoolWest; _airPool = SEN_airPoolWest;};
    case CIVILIAN: {_unitPool = SEN_unitPoolCiv; _vehPool = SEN_vehPoolCiv; _airPool = SEN_airPoolCiv};
    case RESISTANCE: {_unitPool = SEN_unitPoolRebel; _vehPool = SEN_vehPoolRebel; _airPool = SEN_airPoolRebel; _side = CIVILIAN;};
    default {_unitPool = SEN_unitPool; _vehPool = SEN_vehPool; _airPool = SEN_airPool;};
};

_grp = createGroup _side;
_grp allowfleeing 0;
_driverArray = [];

for "_j" from 0 to (_count - 1) do {
    _unit = objNull;
    _pos = [_Opos, 10] call SEN_fnc_findSavePosition;
    call {
        if (_type isEqualTo 0) exitWith {
            (selectRandom _unitPool) createUnit [_pos, _grp];
        };

        if (_type isEqualTo 2) then {
            _veh = createVehicle [(selectRandom _airPool),_pos,[],0,"FLY"];
        } else {
            _veh = (selectRandom _vehPool) createVehicle _pos;
        };

        _unit = _grp createUnit [(selectRandom _unitPool),_pos, [], 0, "NONE"];
        _unit moveInDriver _veh;
        _driverArray pushBack _unit;

		if (_setSkill) then {
		    _unit setSkill 0.9;
	    };

        if !((_veh emptyPositions "gunner") isEqualTo 0) then {
            _unit = _grp createUnit [(selectRandom _unitPool),_pos, [], 0, "NONE"];
            _unit moveInGunner _veh;
        };
    };
	if (_setSkill) then {
        _unit setSkill 0.9;
	};
};
if (_uncache) then {_grp setVariable ["JK_noCache", true, true]};
if (_type isEqualTo 0) exitWith {_grp};

_driverArray
