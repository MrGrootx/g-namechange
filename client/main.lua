ESX = exports["es_extended"]:getSharedObject()


Citizen.CreateThread(function()
   -- Target
   exports.ox_target:addBoxZone({
      coords = vector3(Config.Target.x, Config.Target.y, Config.Target.z),
      size = vector3(1, 1, 1),
      rotation = 45,
      debug = Config.Target.debugs,

      options = {
         {
            icon = "fa-solid fa-file-signature",
            label = 'Open Name Change Menu',
            onSelect = function()
               local input = lib.inputDialog('Name Change Menu', {
                  {
                     type = 'input',
                     label = 'FirstName',
                     placeholder = 'Enter Your FirstName',
                     icon = 'fa-solid fa-note-sticky',
                     required = true,
                     -- default = "ex: justgroot",
                     default = "firstname",
                     min = 2,
                     max = 16,
                  }, {
                  type = 'input',
                  label = 'LastName',
                  placeholder = 'Enter Your LastName',
                  icon = 'fa-solid fa-note-sticky',
                  required = true,
                  default = "lastname",
                  min = 2,
                  max = 16,
               },
                  {
                     type = 'checkbox',
                     label = 'Are you sure..!',
                     required = true
                  },
               })

               if input then
                  local fName = input[1]
                  local lName = input[2]
                  print(json.encode(input, { indent = true }))
                  TriggerServerEvent('mg_namechange:event', fName, lName)
               end
            end
         }
      }

   })
end)
