local CLASS = player.RegClass("terrorist_hl2")

function CLASS.Off(self)
    if CLIENT then return end
end

CLASS.CanUseDefaultPhrase = true

local SubMaterials = {
    -- Male
    ["models/player/group01/male_01.mdl"] = 3,
    ["models/player/group01/male_02.mdl"] = 2,
    ["models/player/group01/male_03.mdl"] = 4,
    ["models/player/group01/male_04.mdl"] = 4,
    ["models/player/group01/male_05.mdl"] = 4,
    ["models/player/group01/male_06.mdl"] = 0,
    ["models/player/group01/male_07.mdl"] = 4,
    ["models/player/group01/male_08.mdl"] = 0,
    ["models/player/group01/male_09.mdl"] = 2,
    -- FEMKI
    ["models/player/group01/female_01.mdl"] = 2,
    ["models/player/group01/female_02.mdl"] = 3,
    ["models/player/group01/female_03.mdl"] = 3,
    ["models/player/group01/female_04.mdl"] = 1,
    ["models/player/group01/female_05.mdl"] = 2,
    ["models/player/group01/female_06.mdl"] = 4
}

local commander_submaterials = {
    ["models/player/group03/male_01.mdl"] = 0,
    ["models/player/group03/male_02.mdl"] = 0,
    ["models/player/group03/male_03.mdl"] = 0,
    ["models/player/group03/male_04.mdl"] = 0,
    ["models/player/group03/male_05.mdl"] = 0,
    ["models/player/group03/male_06.mdl"] = 0,
    ["models/player/group03/male_07.mdl"] = 0,
    ["models/player/group03/male_08.mdl"] = 0,
    ["models/player/group03/male_09.mdl"] = 0,
    ["models/player/group03/female_01.mdl"] = 0,
    ["models/player/group03/female_02.mdl"] = 0,
    ["models/player/group03/female_03.mdl"] = 0,
    ["models/player/group03/female_04.mdl"] = 0,
    ["models/player/group03/female_05.mdl"] = 0,
    ["models/player/group03/female_06.mdl"] = 0
}

function CLASS.On(self)
    if CLIENT then return end
    timer.Simple(.1,function()
        local Appearance = self.CurAppearance or hg.Appearance.GetRandomAppearance()        

        self:SetPlayerColor(Color(0, 60, 10):ToVector())
        self:SetNetVar("Accessories", "")
        self:SetSubMaterial()
        local slots = self:GetSubMaterialSlots()
        for k,v in ipairs(slots) do
            self:SetSubMaterial(v, ThatPlyIsFemale(self) and "models/humans/female/group02/citizen_sheet" or "models/humans/male/group02/citizen_sheet")
        end
        self.CurAppearance = Appearance
    end)
end

function CLASS.Guilt(self, victim)
    if CLIENT then return end

    if victim:GetPlayerClass() == self:GetPlayerClass() then
        return 1
    end
end