Citizen.CreateThread(function()
   Citizen.Wait(0)
   for _, v in ipairs(Config.NPCS) do
      -- print(json.encode(v))
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
         Citizen.Wait(0)
      end
      local ped = CreatePed(4, v.model, v.coords, v.heading, 0.0, false, false, true)
      SetEntityHeading(ped, v.heading)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
   end

   for _, v in ipairs(Config.mapBlip) do
      local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
      SetBlipSprite(blip, v.Icon)
      SetBlipColour(blip, v.Color)
      SetBlipDisplay(blip, v.Display)
      SetBlipAlpha(blip, 250)
      SetBlipScale(blip, 0.6)
      SetBlipAsShortRange(blip, true)
      PulseBlip(blip)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentSubstringPlayerName(v.Name)
      EndTextCommandSetBlipName(blip)
      
   end
end)
