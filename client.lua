--[[
Miner Job | Created by JaxDanger
This File is under fivem's escrow. If you see this, then shame on you for leaking my script.
]]--
if not vRP.modules.Jax then return print('modules.Jax doesn\'t exist.') end

-- this module define some Jax tools and functions
local Jax = class("Jax", vRP.Extension)

function Jax:__construct()
  vRP.Extension.__construct(self)

  -- If player is in the driver seat of a vehicle, set weapon to unarmed and disable shooting
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local ped = GetPlayerPed(-1)
      if IsPedInAnyVehicle(ped, false) then
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 25, true)
      end
    end
  end)
end

vRP:registerExtension(Jax)