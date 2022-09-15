
local buy1 = self:child("Button1")
local buy2 = self:child("Button2")
local buy3 = self:child("Button3")
local index

buy1.onMouseClick = function()
  index =  1
  PackageHandlers.sendClientHandler("buyShop", {index =index}, function(...)
  end)
end

buy2.onMouseClick = function()
  index =  2
  PackageHandlers.sendClientHandler("buyShop", {index =index}, function(...)
  end)
end

buy3.onMouseClick = function()
  index =  3
  PackageHandlers.sendClientHandler("buyShop", {index =index}, function(...)
  end)
end
