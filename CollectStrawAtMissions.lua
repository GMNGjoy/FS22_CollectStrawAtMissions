-- Copyright derSchreiner

CollectStrawAtMissions = {};

function CollectStrawAtMissions:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, CollectStrawAtMissions.getIsMissionWorkAllowed);
end; 

function CollectStrawAtMissions:getIsMissionWorkAllowed(superFunc, farmId, x, z, workAreaType)
    return superFunc(self, farmId, x, z, workAreaType) or (
        (workAreaType == WorkAreaType.FORAGEWAGON or 
            workAreaType == WorkAreaType.BALER or
            workAreaType == WorkAreaType.WINDROWER or
            workAreaType == WorkAreaType.PELLETIZER)
        and superFunc(self, farmId, x, z, WorkAreaType.COMBINESWATH)
    );
end

addModEventListener(CollectStrawAtMissions);

