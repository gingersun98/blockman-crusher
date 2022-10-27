print("startup ui")
local Btn_close = self:GetChildByName('Btn_close')
local Txt_rankTitle = self:GetChildByName('Txt_rankTitle')
local VL_grid = self:GetChildByName('VL_grid')
local DW_grid = VL_grid:GetChildByName('DW_grid'):Clone()

function self:Init(packet)
    self:SetRank(packet)
end

--Update UI based on ranking data
function self:SetRank(packet)
    Txt_rankTitle.Text = packet.rankName
    --Please clear the child object of this parent class first
    VL_grid:DestroyAllChildren()

    --Clone as many DW_grid UI as there are data, and set the data display directly
    for rank, data in ipairs(packet.powerDataList) do
        local teamGrid = DW_grid:Clone()
        teamGrid.Parent = VL_grid
        teamGrid:GetChildByName('Txt_name').Text = data.key
        teamGrid:GetChildByName('Txt_power').Text = data.value
    end
end

local event = Btn_close:GetEvent("OnClick")
event:Bind(function()
    self:Destroy()
end)