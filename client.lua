--[[
Miner Job | Created by JaxDanger
This File is under fivem's escrow. If you see this, then shame on you for leaking my script.
]]--
if not vRP.modules.Jax then return print('modules.Jax doesn\'t exist.') end

-- this module define some Jax tools and functions
local Jax = class("Jax", vRP.Extension)

function Jax:__construct()
  vRP.Extension.__construct(self)

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0) -- Add a small delay to prevent crashing
      if isPlayerInVehicle() then
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local speed = GetEntitySpeed(vehicle) * 3.6
        if speed > 50 then
          SetEntityMaxSpeed(vehicle, 50.0)
        end
        
        -- Check if the player is in the driver's seat
        if GetPedInVehicleSeat(vehicle, -1) == ped then
          -- Disable weapon swap and set weapon to unarmed
          SetPedCanSwitchWeapon(ped, false)
          SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
          -- Enable weapon swap when not in the driver's seat
          SetPedCanSwitchWeapon(ped, true)
        end
      else
        -- Enable weapon swap when not in a vehicle
        local ped = GetPlayerPed(-1)
        SetPedCanSwitchWeapon(ped, true)
      end
    end
  end)
end

vRP:registerExtension(Jax)