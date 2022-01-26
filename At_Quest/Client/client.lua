local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
local ESX = nil
local timer = 0
local blipsCops               = {}
HasAlreadyEnteredMarker = false




TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    Holograms()
    KeyControl()
end)



---====Kiram Kolofte Injori Neveshtam====---


--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(9000000) 
--		TriggerServerEvent('Quest:NewQuest', GetPlayerServerId(PlayerId()))
--	end
--end)




function alireza()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            if GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, false) < 2 then
                return true
            end
        end
    end
    return false
end

function contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

function Holograms()
    while true do
        Citizen.Wait(5)
        for k,v in pairs(Config.Zones) do
            for i=1, #v.Pos, 1 do
                if GetDistanceBetweenCoords( v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, GetEntityCoords(GetPlayerPed(-1)), false) < 10.0 then
                    local alireza11 = 5
                    local sizealireza1 = { x = 0.8, y = 0.8, z = 0.8 }
                    local coloralireza2 = { r = 7, g = 202, b = 2 }
                    DrawMarker(alireza11, v.Posm[i].x, v.Posm[i].y, v.Posm[i].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, sizealireza1.x, sizealireza1.y, sizealireza1.z, coloralireza2.r, coloralireza2.g, coloralireza2.b, 100, false, true, 2, false, false, false, false)
                    DrawMarker(6, v.Posm[i].x, v.Posm[i].y, v.Posm[i].z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, coloralireza2.r, coloralireza2.g, coloralireza2.b, 100, false, true, 2, false, false, false, false)

                end	             
            end
        end
	end
end




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if alireza() then
            ESX.ShowHelpNotification('~h~~w~Pls~r~ [E]~w~ To Open Quest')
        end

        if IsControlJustReleased(0, Keys['E']) and alireza() then
            autofix()
        end


        if IsControlJustReleased(0, Keys['BACKSPACE']) and alireza() then
            ESX.UI.Menu.CloseAll()
        end
    end 
end)



--====Ped Quest====----

Citizen.CreateThread(function()
    RequestModel(GetHashKey("mp_f_boatstaff_01"))
    while not HasModelLoaded(GetHashKey("mp_f_boatstaff_01")) do
      Wait(1)
    end
    local Quest =  CreatePed(10,  0x3293B9CE, -454.55, 1125.76, 324.89, 339.5, false, false)
    SetEntityHeading(Quest, 339.5)
    FreezeEntityPosition(Quest, true)
    SetEntityInvincible(Quest, true)
    SetBlockingOfNonTemporaryEvents(Quest, true)
end)




--====Menu Quest====--

function autofix()

        local elements = { 
            {label = '<b><span style="color:yellow;">✅: Quest Solo</span></b>',    value = 'solo'},
            {label = '<b><span style="color:yellow;">❗: Quest Haftegi(Level Dar)</span></b>',   value = 'haftegi'},
            {label = '<b><span style="color:yellow;">💥: Quest Mahane(Level Dar)</span></b>',   value = 'mahaneh'},
            {label = '<b><span style="color:yellow;">====================</span></b>',   value = '..'},
            {label = '<b><span style="color:yellow;">💲: My Info In Quest</span></b>',   value = 'etmamkirman'},
            {label = '<b><span style="color:yellow;">🤷‍♂️: Quest Chist</span></b>',   value = 'BALADNISTDIGEHKHOBYARO'},
      }

    
      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Quest_Menu',
        {
          title    = ('Quest_Menu'),
          align    = 'center',
          elements = elements,
        },

        function(data, menu)
            if data.current.value == 'solo' then
                Opensolo()
            elseif data.current.value == 'haftegi' then
                QuestHaftegi()
            elseif data.current.value == 'mahaneh' then
                questakhar()
            elseif data.current.value == 'etmamkirman' then
                local timeneedw8 = 50000
                if GetGameTimer() - timeneedw8 > timer then
                    timer = GetGameTimer()
                    Questmuinfoo()
                else
                    ESX.ShowNotification("~r~Lotfan  Spam nakonid, Va "..tostring(math.floor(-(GetGameTimer()-(timer+timeneedw8))/1000)).."S Sabr Konid")
                    -- timer = GetGameTimer()
                end

            elseif data.current.value == 'BALADNISTDIGEHKHOBYARO' then
                Queschist()
            end
        end)


end


function Questmuinfoo()
    TriggerServerEvent('AT_Quest:Chekmyinfofromquest')
end



function  Opensolo()
    local elements = { 
        {label = '========Award  Quest:========',   value = '....'},
        {label = ' 💲: 2,000,000 Cash',   value = '...'},
        {label = '======Lavazem Mored Niyaz======',   value = '....'},
        {label = '<b><span style="color:yellow;">Javaher              +900</span></b>',    value = '...'},
        {label = '<b><span style="color:yellow;">Sang                 +50</span></b>',   value = '....'},
        {label = '<b><span style="color:yellow;">Sange boresh khorde  +200</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">ShahDone             +150</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Tala                 +50</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Unknown box          +5</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Unknown bag          +5</span></b>',   value = '..'},
        {label = '======Payan Quest======',   value = '....'},
        {label = '<b><span style="color:yellow;">✅:Etmam Solo Quest</span></b>',   value = 'endsolo'},
  }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Quest_Menu_solo',
    {
      title    = ('Quest_Menu_solo'),
      align    = 'center',
      elements = elements,
    },

    function(data, menu)
    if data.current.value == 'endsolo' then
        TriggerServerEvent('Solo_Quest:chekend', GetPlayerServerId(PlayerId()))
    end
    end)
end




function  QuestHaftegi()
    local elements = { 
        {label = '========Award  Quest:========',   value = '....'},
        {label = ' 💲: 4,000,000 Cash',   value = '...'},
        {label = ' 🎃: +1 Skin Gun',   value = '...'},
        {label = ' 🎃: +1 Level',   value = '...'},
        {label = '======Lavazem Mored Niyaz======',   value = '....'},
        {label = '<b><span style="color:yellow;">Javaher              +1000</span></b>',    value = '...'},
        {label = '<b><span style="color:yellow;">Sang                 +50</span></b>',   value = '....'},
        {label = '<b><span style="color:yellow;">Sange boresh khorde  +200</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">ShahDone             +150</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Tala                 +50</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Unknown box          +3</span></b>',   value = '..'},
        {label = '======Payan Quest======',   value = '....'},
        {label = '<b><span style="color:yellow;">✅:Etmam Quest Haftegi</span></b>',   value = 'endsolos'},
  }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Quest_Menu_Haftegi',
    {
      title    = ('Quest_Menu_Haftegi'),
      align    = 'center',
      elements = elements,
    },

    function(data, menu)
    if data.current.value == 'endsolos' then
        TriggerServerEvent('Haftefi_Quest:chekend', GetPlayerServerId(PlayerId()))
    end
    end)
end



function openchekmenu()

    local elements = { 
        {label = '========Quest Hai Ke Mitavanid Beravid========',   value = '....'},
        {label = '<b><span style="color:yellow;">✅: Solo Quest(Just Cash)</span></b>',   value = 'enddddd'},
        {label = '<b><span style="color:yellow;">✅: Quest Haftegi(Level) </span></b>',   value = 'enddddd'},
        {label = '<b><span style="color:yellow;">✅: Quest Mahane(Level)</span></b>',   value = 'enddddd'},
  }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Quest_Menu_Cheking',
    {
      title    = ('Quest_Menu_Cheking'),
      align    = 'center',
      elements = elements,
    },

    function(data, menu)
        if  data.current.value == 'PISTOL' then
            TriggerServerEvent('Xpsystem:piston', GetPlayerServerId(PlayerId()))
        end
    end)
end

RegisterNetEvent('AT_Quesy:Openmenu1')
AddEventHandler('AT_Quesy:Openmenu1', function(Source)
    openchekmenu()
end)

function  questakhar()
    local elements = { 
        {label = '========Award  Quest:========',   value = '....'},
        {label = ' 💲: 6,000,000 Cash',   value = '...'},
        {label = ' 🎃: +1 Skin Gun',   value = '...'},
        {label = ' 🎃: +2 Level',   value = '...'},
        {label = '======Lavazem Mored Niyaz======',   value = '....'},
        {label = '<b><span style="color:yellow;">Javaher              +1000</span></b>',    value = '...'},
        {label = '<b><span style="color:yellow;">Sang                 +100</span></b>',   value = '....'},
        {label = '<b><span style="color:yellow;">Sange boresh khorde  +200</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">ShahDone             +150</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Tala                 +50</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Unknown box          +10</span></b>',   value = '..'},
        {label = '<b><span style="color:yellow;">Unknown bag          +10</span></b>',   value = '..'},
        {label = '======Payan Quest======',   value = '....'},
        {label = '<b><span style="color:yellow;">✅:Etmam Quest Mahaneh</span></b>',   value = 'enddddd'},
  }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Quest_Menu_mahaneh',
    {
      title    = ('Quest_Menu_mahaneh'),
      align    = 'center',
      elements = elements,
    },

    function(data, menu)
        if data.current.value == 'enddddd' then
            TriggerServerEvent('At_Quest:Mahanehcheking', GetPlayerServerId(PlayerId()))
        elseif data.current.value == 'PISTOL' then
            TriggerServerEvent('Xpsystem:piston', GetPlayerServerId(PlayerId()))
        end
    end)
end



function Queschist()
    ESX.ShowMissionText('~y~Quest Kari Hast Ke Mitonid Ba Ghozashtan Time Va Raftan Be Job Hay Public Mesl Mineri Va .. ')
    Citizen.Wait(8000)
    ESX.ShowMissionText('~y~Azash Pol  Dar Biayardi ')
    Citizen.Wait(3000)
    ESX.ShowMissionText('~y~Va Kar Hai Ke BeShoma Ghofte Shodeh Dar Har Quest Robayad Anjam Bedid Va on Item Haro Bedast Biyarid Be Be Bot Tahvil Bedid.')
end



function NearAny()
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            if GetDistanceBetweenCoords(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, GetEntityCoords(GetPlayerPed(-1)), false) < 3.0 then
                return true
            end
        end
    end
    return false
end



function trim1(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end


--====Off====--

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
end



---=====Blip======---



local blips = {

	{title="Quest", colour=0 , id=594, x= -454.55, y= 1125.76, z= 328.89},
  
}
  
Citizen.CreateThread(function()
  
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 1.1)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)




announcestring = false
lastfor = 5


RegisterNetEvent('announcement')
announcestring = false
AddEventHandler('announcement', function(msg)
	announcestring = msg
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(lastfor * 2000)
	announcestring = false
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~y~Quest Level Up Done")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if announcestring then
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
    end
end)


