Hi Im AliReza_At 🎃

----------------------------------------
My Discord --> AliReza_At#0690
My Channel  --> discord.gg/JwmtbkHM2y
----------------------------------------




How To Use This Script. 

[1]Start This Script In (cfg) --> ensure At_Quest

[2]Runed Sql File In Hedisql (Sql/quest.sql)

[3]Runed Server And Join ... 🥒


===========================================================================

Script Specifications. 

/givelevel for add level to other player
/level for show your level


===========================================================================


callback get level (client 😂)



ESX.TriggerServerCallback('AT_Quest:Cheklevel', function(bool)
    if  bool then
        Wait(100)
        ---Continues Trigger or Function
    else
        ESX.ShowNotification("~r~Your Level Not Valid")
        CancelEvent()
    end
end, 2 --[[level]])

===========================================================================


[Important]To get information and buy newer versions of this script, you can open a ticket in our Discord channel.
