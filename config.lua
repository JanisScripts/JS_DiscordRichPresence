Config = {}
Translation = {}

Config.ApplicationID = "1096095103128449044" -- Enter your Discord Application ID --> https://discord.com/developers/applications/
Config.UpdateTime = 5 -- 1 = 1 Second -> Updates every Second. Default is 60 Seconds
Config.Locale = "en" -- Current translations: de, en
Config.YourDisordServerLink = "https://discord.gg/JmYW5yECaS"



--[[ Premade Text Version for RichPresenceText, LargeImageText and SmallImageText - Just 

"playerFPS" = Shows the players FPS when you hover the image 
"playerID" = Shows the Server ID of the player
"discordServer" = Shows your Discord Server Link from Config.YourDisordServerLink = "YOUR_LINK_HERE"
"playerLocZone" = Shows the current Zone Location of the Player
"playerLocStreet" = Shows the current Street Location of the Player
"standard" = Standart Option

If you want to display own text just write it there
 ]]

--Main Text Options
Config.SetRichPresenceText = true -- Main Text
Config.RichPresenceText = "standard" --Main Text of DiscordRP 
-- Config.RichPresenceText = "My Discord: https://discord.gg/..." -- As the DRP Buttons do not work anymore, the only way you can show links is by showing them directly in the text 
 


-- Icon Options
Config.EnableLargeImage = true -- Large Image enabled. Replace true with false to disable.
Config.LargeImageName = "hyrunelogo" -- Image Name without .png, .jpg, or .jpeg --> https://discord.com/developers/applications/YOUR_APPLICATION_ID/rich-presence/assets

Config.EnableLargeImageText = true -- Text which shows up if you hover large image. Replace true with false to disable.
Config.LargeImageText = "Hyrune.net" -- Text which shows up if you hover image. 



Config.EnableSmallImage = true -- Small Image enabled. Replace true with false to disable. 
Config.SmallImageName = "janisscripts" -- Image Name without .png, .jpg, or .jpeg --> https://discord.com/developers/applications/YOUR_APPLICATION_ID/rich-presence/assets

Config.EnableSmallImageText = true -- Text which shows up if you hover small image. Replace true with false to disable.
Config.SmallImageText = "By Janis Scripts" -- Text which shows up if you hover image.


-- Translations
Translation = {
    ['de'] = {
        ['zone_text'] = 'Derzeitige Position: ',
        ['discordserver_text'] = 'Unser Discord:',
        ['playerfps_text'] = 'Derzeitige FPS: ',
        ['street1_text'] = 'Befindet sich auf: ',
    },
    ['en'] = {
        ['zone_text'] = 'Current Position: ',
        ['discordserver_text'] = 'Our Disord: ',
        ['playerfps_text'] = 'Current FPS: ',
        ['street1_text'] = 'Located on: ',
    }   
}