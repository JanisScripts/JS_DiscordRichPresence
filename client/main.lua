Citizen.CreateThread(function()
    while true do

        local prevtime = GetGameTimer()
        local prevframes = GetFrameCount()
        local fps = -1
        local curtime = GetGameTimer()
        local curframes = GetFrameCount()	
        local id = GetPlayerServerId(PlayerId())
        local playername = GetPlayerName(PlayerId())
        local player = GetPlayerPed(GetPlayerFromServerId(playerid))
        local position = GetEntityCoords(player, true)
        local zoneID = GetNameOfZone(position.x, position.y, position.z)
        local zone = GetLabelText(zoneID)
        local coords = GetEntityCoords(ped)
        local streetcord1, streetcord2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local street1 = GetStreetNameFromHashKey(streetcord1)
        local street2 = GetStreetNameFromHashKey(streetcord2)
        
        
        SetDiscordAppId(Config.ApplicationID)

        if Config.EnableLargeImage then
            SetDiscordRichPresenceAsset(Config.LargeImageName)
        end

        if Config.SetRichPresenceText then
            if Config.RichPresenceText == "standard" then
                SetRichPresence("Mainhatten Scripts - discord.gg/ce6auKzCbV")
            elseif Config.RichPresenceText == "playerFPS" then
                Citizen.CreateThread(function()	  
                    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do	        
                        Citizen.Wait(Config.UpdateTime*1000)         
                    end
                    while true do		    
                        if((curtime - prevtime) > 1000) then
                            fps = (curframes - prevframes) - 1				
                            prevtime = curtime
                            prevframes = curframes
                        end
                        SetRichPresence(Translation[Config.Locale]['playerfps_text'] ..fps.. "FPS")
                        Citizen.Wait(Config.UpdateTime*1000) 	
                    end	
                end)
            elseif Config.RichPresenceText == "playerID" then
                SetRichPresence(playername.." [ID: "..id.."]")
            elseif Config.RichPresenceText == "playerLocZone" then
                SetRichPresence(Translation[Config.Locale]['zone_text'] ..zone)
            elseif Config.RichPresenceText == "playerLocStreet" then
                SetRichPresence(Translation[Config.Locale]['street1_text'] ..street1.. " | " ..street2)
            elseif Config.RichPresenceText == "discordServer" then
                SetRichPresence(Translation[Config.Locale]['discordserver_text'] ..Config.YourDisordServerLink)
            else
                SetRichPresence(Config.RichPresenceText) 
            end
        end



        if Config.EnableLargeImageText then
            if Config.LargeImageText == "playerFPS" then
                Citizen.CreateThread(function()	  
                    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do	        
                        Citizen.Wait(Config.UpdateTime*1000)       
                    end
                    while true do		    
                        if((curtime - prevtime) > 1000) then
                            fps = (curframes - prevframes) - 1				
                            prevtime = curtime
                            prevframes = curframes
                        end
                        SetDiscordRichPresenceAssetText(Translation[Config.Locale]['playerfps_text'] ..fps.. "FPS")
                        Citizen.Wait(Config.UpdateTime*1000) 	
                    end	
                end)
            elseif Config.LargeImageText == "playerID" then
                SetDiscordRichPresenceAssetText(playername.." [ID: "..id.."]")
            elseif Config.LargeImageText == "playerLoc" then
                SetDiscordRichPresenceAssetText(Translation[Config.Locale]['zone_text'] ..zone)
            elseif Config.LargeImageText == "playerLocStreet" then
                SetDiscordRichPresenceAssetText(Translation[Config.Locale]['street1_text'] ..street1.. " | " ..street2)
            elseif Config.LargeImageText == "discordServer" then
                SetDiscordRichPresenceAssetText(Translation[Config.Locale]['discordserver_text'] ..Config.YourDisordServerLink)
            else
                SetDiscordRichPresenceAssetText(Config.LargeImageText)
            end 
        end
        


        if Config.EnableSmallImage then
            SetDiscordRichPresenceAssetSmall(Config.SmallImageName)
        end

        if Config.EnableSmallImageText then
            if Config.SmallImageText == "playerFPS" then
                Citizen.CreateThread(function()	  
                while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do	        
                    Citizen.Wait(5*1000)     
                end
                while true do		  
                    if((curtime - prevtime) > 1000) then
                        fps = (curframes - prevframes) - 1				
                        prevtime = curtime
                        prevframes = curframes
                    end
                    SetDiscordRichPresenceAssetSmallText(Translation[Config.Locale]['playerfps_text'] ..fps.. "FPS")
                    Citizen.Wait(Config.UpdateTime*1000) 	
                    end	
                end)
            elseif Config.SmallImageText == "playerID" then
                SetDiscordRichPresenceAssetSmallText(playername.." ["..id.."]")
            elseif Config.SmallImageText == "playerLoc" then
                SetDiscordRichPresenceAssetSmallText(Translation[Config.Locale]['zone_text'] ..zone)
            elseif Config.SmallImageText == "playerLocStreet" then
                SetDiscordRichPresenceAssetSmallText(Translation[Config.Locale]['street1_text'] ..street1.. " | " ..street2)
            elseif Config.SmallImageText == "discordServer" then
                SetDiscordRichPresenceAssetSmallText(Translation[Config.Locale]['discordserver_text'] ..Config.YourDisordServerLink) 
            else
                SetDiscordRichPresenceAssetSmallText(Config.SmallImageText)
            end
        end
        Citizen.Wait(Config.UpdateTime*1000) 
    end
end)
