/// @description Update death count

if hasData("dragamiDeath") addDataPair("dragamiDeath",1);
else addDataPair("dragamiDeath",hasData("dragamiDeath")+1);
event_inherited();

