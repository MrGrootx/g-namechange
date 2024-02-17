ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('mg_namechange:event')
AddEventHandler('mg_namechange:event', function(fName, lName)
   -- print(fName, lName)
   local xPlayer = ESX.GetPlayerFromId(source)
   -- print(json.encode(xPlayer, { indent = true}))

   if xPlayer then
      MySQL.Async.transaction(

         {
            'UPDATE users SET firstname = @fName WHERE identifier = @newfirstname',
            'UPDATE users SET lastname = @lName WHERE identifier = @newsecondname',
         },
         {
            -- FirstName
            ['fName'] = fName,
            ['newfirstname'] = xPlayer.identifier,

            -- LastName
            ['lName'] = lName,
            ['newsecondname'] = xPlayer.identifier
         }

      )
      -- Notification
      Notification(nil, 'Your names has been Changed, Please restart your game', 'success', 'top', 5000)

      -- Webhook
      local dmsg =
          '**Old Name:** ' ..
          xPlayer.name .. '\n' ..
          '**Identifier:** ```' ..
          xPlayer.identifier .. '```' .. '\n **New Names ``🐱``**' .. '\n**FirstName** : ' .. fName .. "\n" ..
          '**LastName** : ' .. ' ' .. lName
      DiscordLog(16753920, 'Someone changed their names', dmsg)
   end
end)

-- Discord webhook function
function DiscordLog(color, title, message)
   local Embed = {
      {
         ['color'] = color,
         ['title'] = "**" .. title .. "**",
         ['description'] = message,
      }
   }
   PerformHttpRequest(Config.Discord.webhookURL, function(err, text, headers) end, 'POST',
      json.encode({ username = 'Groot Development', embeds = Embed }), { ['Content-Type'] = 'application/json' })
end

-- Notification Function

function Notification(title, desc, type, position, duration)
   TriggerClientEvent('ox_lib:notify', source, {
      title = title,
      description = desc,
      type = type,
      position = position,
      duration = duration
   })
end
