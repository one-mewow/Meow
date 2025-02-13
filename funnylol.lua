local Global = getgenv and getgenv() or _G
local setclipboard = setclipboard or print
Global.Reanimation = Global.Reanimation or "PermaDeath"
Global.FlingType = Global.FlingType or 'Mixed'

local Enabled = true

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService('Lighting')
local TweenService = game:GetService('TweenService')

local Blur = Instance.new("BlurEffect")
Blur.Size = 1

local Camera = workspace.CurrentCamera

Global._reanimate = loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/reanim.lua'))()
local Library = loadstring(game.HttpService:GetAsync("https://raw.githubusercontent.com/shidemuri/scripts/main/ui_lib.lua"))()

if not game:IsLoaded() then game.Loaded:Wait() end

do -- UI
	local Pendulum = Library:New("Pendulum Hub")
	local SettingsTab = Pendulum:NewTab("Settings")
	local CreditsTab = Pendulum:NewTab("Credits")
	local OMGFESEX = Pendulum:NewTab("Sex 😏")
	local LOL = Pendulum:NewTab("Bypass Audio Update")
	local ScriptsTab = Pendulum:NewTab("Scripts")
	local reanimtype = SettingsTab:NewLabel('Reanimation type: ' .. Global.Reanimation)
	local flingtype = SettingsTab:NewLabel('Fling type: ' .. Global.FlingType)
	SettingsTab:NewLabel('Note: HumanoidRootPart fling only works after permadeath is on')
	local anim = Pendulum:NewTab('Animation ID Player')
	local cwScriptsTab = Pendulum:NewTab('Coffeeware')

	UserInputService.InputBegan:Connect(function(Input,Typing)
		if Input.KeyCode == Enum.KeyCode.L and not Typing and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			Enabled = not Enabled
			if Enabled then
				Pendulum:Show()
			else
				Pendulum:Hide()
			end
		end
	end)

	do -- Reanimation Setting
		SettingsTab:NewButton("Toggle Perma Death", "PermaDeath / Simple", function()
			if Global.Reanimation == "PermaDeath" then
				Global.Reanimation = "Simple"
				Global.Fling = 'Right Arm'
				reanimtype.Text = 'Reanimation Type: Simple'
			elseif Global.Reanimation == "Simple" then
				Global.Reanimation = "PermaDeath"
				Global.Fling = 'HumanoidRootPart'
				reanimtype.Text = 'Reanimation Type: PermaDeath'
			end
		end, true)
		SettingsTab:NewButton("Toggle Fling Type", "Prediction only / Click only / Mixed", function()
			if Global.FlingType == 'Mixed' then
				Global.FlingType = 'Prediction only'
			elseif Global.FlingType == 'Prediction only' then
				Global.FlingType = 'Click only'
			elseif Global.FlingType == 'Click only' then
				Global.FlingType = 'Mixed'
			end
			flingtype.Text = 'Fling type: '.. Global.FlingType
		end,true)
	end

	do -- ScriptsTab Buttons
		ScriptsTab:NewButton("Neptunian V", "An original. If you want the hat join the discord.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/34oqvdH"))()
		end)

		ScriptsTab:NewButton("Sonic", "All other versions don't fling except this one.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cmw7BP"))()
		end)

		ScriptsTab:NewButton("Joy", "Its got some cute stufff", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IUQBUy"))()
		end)

		ScriptsTab:NewButton("Elio Blasio", "Literally anyone with a gun. If you want hats join the discord.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HYO4ru"))()
		end)

		ScriptsTab:NewButton("Ender", "Smashy boi", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35VT02P"))()
		end)

		ScriptsTab:NewButton("KillBot V2", "The script kinda sucks lol", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sQWSuV"))()
		end)

		ScriptsTab:NewButton("Star Platinum Over Heaven", "A really fun script for people who have played a jojo game before.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cpvrvr"))()
		end)

		ScriptsTab:NewButton("Chill", "You can get a lot of peoples attention with this.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pOdNfP"))()
		end)

		ScriptsTab:NewButton("Lutris v2", "Definetely an OP script. Join discord for hat", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vKDz8A"))()
		end)

		ScriptsTab:NewButton("Memeus v2.5", "Dead memes from 2019 (some arent dead)", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tHxG9k"))()
		end)

		ScriptsTab:NewButton("Meme animation", "This one is just some emotes and dances.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35YGnnw"))()
		end)

		ScriptsTab:NewButton("Krystal dance", "Some nice dances. My favorite is U.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KuRnbv"))()
		end)

		ScriptsTab:NewButton("Spinning Blade", "Definetely has the best idle animation", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HTllEm"))()
		end)

		ScriptsTab:NewButton("Xester", "The strongest script out of them all.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35xGEyg"))()
		end)

		ScriptsTab:NewButton("Caducus", "Edgy demon guy.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cln304"))()
		end)

		ScriptsTab:NewButton("Minigun", "Have fun spraying skids.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cqns13"))()
		end)

		ScriptsTab:NewButton("Lightning Sword", "Similar to Dual Ultima. its basiclly an edit.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3CnTo6h"))()
		end)

		ScriptsTab:NewButton("Corrupted Overseer", "My favorite script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3q8ECf5"))()
		end)

		ScriptsTab:NewButton("Darth Vadar", "For the star wars fans.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vPlhD8"))()
		end)

		ScriptsTab:NewButton("Sans", "left click to fling. time it with attacks to fling.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vMd56u"))()
		end)

		ScriptsTab:NewButton("Zen", "literally zenyata", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IMQOcx"))()
		end)

		ScriptsTab:NewButton("Gale Fighter", "Another classic!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3ClMnTL"))()
		end)

		ScriptsTab:NewButton("Glove & Sword", "The script isn't broken press f to equip.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3ISOvVv"))()
		end)

		ScriptsTab:NewButton("Reaper", "Reaper from Overwatch", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HTwHIe"))()
		end)

		ScriptsTab:NewButton("Zenith Rifle", "Added because of high request.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KqkSLv"))()
		end)

		ScriptsTab:NewButton("Abyss Eye", "This one is very intimidating.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/361gFPy"))()
		end)

		ScriptsTab:NewButton("Bizzaro", "TPose thing", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3ClMr5X"))()
		end)

		ScriptsTab:NewButton("Sword Guy", "I don't even know the name LOL.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sT1wsg"))()
		end)

		ScriptsTab:NewButton("Sharpshooter", "Laser finger thing", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tCRdrI"))()
		end)

		ScriptsTab:NewButton("Dual Pink Guns", "Reminds me of the matrix for some reason.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vOnA9r"))()
		end)

		ScriptsTab:NewButton("Aureate", "This script can kill your frames in big games.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tEbNb5"))()
		end)

		ScriptsTab:NewButton("Doomspire Brickbattler", "For people who say that old roblox is better.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35UvALg"))()
		end)

		ScriptsTab:NewButton("Star Glitcher", "A free version that doesn't need any hats.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IXe080"))()
		end)

		ScriptsTab:NewButton("Nightmare Sans", "From Dream!tale. Very strong.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3CoQgaf"))()
		end)

		ScriptsTab:NewButton("Abyss Sword", "The first script I converted that uses a gear.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IV2mub"))()
		end)

		ScriptsTab:NewButton("Dark Magic", "If you've played Black Magic you'll love this script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tGWxu2"))()
		end)

		ScriptsTab:NewButton("Torando Gauntlet", "Gauntlet that makes tornados.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sPnaO5"))()
		end)

		ScriptsTab:NewButton("Hidden blades - From AC", "This ones cool.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vOxqbA"))()
		end)

		ScriptsTab:NewButton("Despira", "This one is a balanced range and close ranged script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3MyUAZe"))()
		end)

		ScriptsTab:NewButton("Golden Fireball God", "This somehow reminds me of Asgore.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KI6j6j"))()
		end)

		ScriptsTab:NewButton("Simple Sword", "There isn't much to it.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pMXkIS"))()
		end)

		ScriptsTab:NewButton("Brutal Anti Furry", "Damn you must hate furrys.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HLqxdm"))()
		end)

		ScriptsTab:NewButton("Omni God", "A stupidly powerful script if you know how to use fling properly.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cq1nQc"))()
		end)

		ScriptsTab:NewButton("Baldi", "https://www.youtube.com/watch?v=SciE-AbMLt0", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Kpj1GH"))()
		end)

		ScriptsTab:NewButton("Shedletsky Rage", "Not to much about it.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pLSf3E"))()
		end)

		ScriptsTab:NewButton("Nebula Star Glitcher", "Yes it has the big black lol.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IUb8ZC"))()
		end)

		ScriptsTab:NewButton("Lustris PURPLE", "Purple version of Lustris and different powers", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3MzAGxq"))()
		end)

		ScriptsTab:NewButton("Touhou Magic", "Rain bullet hell on em bitch.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pNw3Wz"))()
		end)

		ScriptsTab:NewButton("Excalibur", "Its just a cool sword thing", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tB2Qzu"))()
		end)

		ScriptsTab:NewButton("John Doe", "Yeah I added him back with better fling", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HWSAX7"))()
		end)

		ScriptsTab:NewButton("What another one", "Yes thats the scripts name Mr. Skiddy Titty", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IUKqjB"))()
		end)

		ScriptsTab:NewButton("Ether", "Do people even read these?", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KhwWyC"))()
		end)

		ScriptsTab:NewButton("Uncle Parlo The Redneck", "Parlo is not a pedophile I swear!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tCGkpF"))()
		end)

		ScriptsTab:NewButton("Eyo Zen", "Guy with eyeball that shoots lasers.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tB2UPK"))()
		end)

		ScriptsTab:NewButton("Cop", "Your average cop.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3CnvhEK"))()
		end)

		ScriptsTab:NewButton("Verlex", "Very unique script that i've seen.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/361hjws"))()
		end)

		ScriptsTab:NewButton("Lost Hope", "Dragon Scythe thing and its cool", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pLoUX1"))()
		end)

		ScriptsTab:NewButton("The Assasian", "A shit ton of moves that are epic", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Cm5lJI"))()
		end)

		ScriptsTab:NewButton("Dragonian Pyramus", "Literally the fucking ender dragon.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HRNuvi"))()
		end)

		ScriptsTab:NewButton("Grappler", "You can go to a city game and use this.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pIMKmg"))()
		end)
		LOL:NewLabel("WARNING: The script will take at least 10 seconds to load")
		LOL:NewLabel("Please be patient!")
		LOL:NewButton("Bypass Roblox Audio Update", "Be patient.", function()
			loadstring(game.HttpService:GetAsync('https://bit.ly/3TcD7sQ'))() 	
		end)

		ScriptsTab:NewButton("Groundbreaker Gauntlets", "Gauntlets of death", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35JnOUC"))()
		end)

		ScriptsTab:NewButton("Sexy Staff Girl", "Gauntlets of death", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35FwHyH"))()
		end)

		ScriptsTab:NewButton("Jojo Super Gauntlets", "Why are there so many gauntlet scripts?", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35Fwyv5"))()
		end)

		ScriptsTab:NewButton("The Pacifist", "No attacks. Just a very chill animation script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/361hKH6"))()
		end)

		ScriptsTab:NewButton("Sakura Blade", "Barely any jitter in these animations.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pLoShL"))()
		end)

		ScriptsTab:NewButton("M41451", "Rainbow AK47 needed join the discord for hat.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35FwKKT"))()
		end)

		ScriptsTab:NewButton("Master Of Elements", "Badass script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IROgtC"))()
		end)

		ScriptsTab:NewButton("AK47", "Very OP gun script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3hPAdJi"))()
		end)

		ScriptsTab:NewButton("AKV", "Very high mag.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35z9zC3"))()
		end)

		ScriptsTab:NewButton("Chips/Pillow", "Crank that real soldia boi.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IXeMlq"))()
		end)

		ScriptsTab:NewButton("Noob Baseball Bat", "This one is very questionable...", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35ZY7il"))()
		end)

		ScriptsTab:NewButton("Ban Sword", "very cool", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35UwqYq"))()
		end)

		ScriptsTab:NewButton("Rainbow Banisher", "OMG RAINBOW HACKER", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sRGZEM"))()
		end)

		ScriptsTab:NewButton("Flamethrower", "Terrorism. What else do you want me to say?", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tIk2TL"))()
		end)

		ScriptsTab:NewButton("Energy Blade Slapper", "POV: you like to look like a retard.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/364fyi8"))()
		end)

		ScriptsTab:NewButton("Sniper", "Stop playing COD and touch some grass.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sRLBdU"))()
		end)

		ScriptsTab:NewButton("Echo Banisher", "Just your average banisher.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pN5il3"))()
		end)

		ScriptsTab:NewButton("What do I even name this?", "you'll just have to execute it to find out what it is", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Ktz4Ua"))()
		end)

		ScriptsTab:NewButton("Incension Reborn", "This is a really cool switcher thing.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tB3w80"))()
		end)

		ScriptsTab:NewButton("The Sun Is A Deadly laser", "The Sun. What did you expect?", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35IeDUt"))()
		end)

		ScriptsTab:NewButton("John Doe Blaster", "insert edgy hacker quote here", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3hKeXER"))()
		end)

		ScriptsTab:NewButton("The Distorted", "Distorting aaaaa", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KtVYdJ"))()
		end)

		ScriptsTab:NewButton("Drone", "I love this way to much", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IUPsN0"))()
		end)

		ScriptsTab:NewButton("Pharoh", "Ankha momento", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3hRiaCx"))()
		end)

		ScriptsTab:NewButton("Technoblade", "No this is not a minecraft script.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/34mb6KS"))()
		end)

		ScriptsTab:NewButton("Demonic Sword", "Sword, nothin else. Pretty unoriginal", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HRBjih"))()
		end)

		ScriptsTab:NewButton("SCP-106", "Scary aa", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HWTD9v"))()
		end)

		ScriptsTab:NewButton("Chara", "knife girl sexy uwu", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3ClNT8p"))()
		end)

		ScriptsTab:NewButton("Video Powers", "Infamous Second Son reference", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vSa70n"))()
		end)

		ScriptsTab:NewButton("Bumper Cars", "Noob get rekt!!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3MIWQgT"))()
		end)

		ScriptsTab:NewButton("God Eater", "Not the guy from fnf", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3Mv1iPX"))()
		end)

		ScriptsTab:NewButton("Golden Claws", "swing", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tBemdX"))()
		end)

		ScriptsTab:NewButton("Big Daddy", "thick", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KpMyjv"))()
		end)

		ScriptsTab:NewButton("Noob Switcher", "Noob get rekt!!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vSfqwO"))()
		end)

		ScriptsTab:NewButton("The Angle", "angel... more like angle", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3pLACAU"))()
		end)

		ScriptsTab:NewButton("The Warden", "lock away their souls up your vagina", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3hM3zrM"))()
		end)

		ScriptsTab:NewButton("Gaster", "man who speaks in handjobs", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3CloY4M"))()
		end)

		ScriptsTab:NewButton("Killer", "scary", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/36ZZqyn"))()
		end)

		ScriptsTab:NewButton("Spectrum Glitcher", "This also has the big black.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sSi0RN"))()
		end)

		ScriptsTab:NewButton("Ultimate Switcher", "Ultimate automaticlly means its the best.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sQSbRW"))()
		end)

		ScriptsTab:NewButton("Mask", "Little boy got mask and he died haha spoiler", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3sPoEYF"))()
		end)

		ScriptsTab:NewButton("Switcher Wing Master", "Switch wing there so many modes", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tHAFyy"))()
		end)

		ScriptsTab:NewButton("Sutart", "I love big bacon boy bacon penis in my mouth", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KtWzft"))()
		end)

		ScriptsTab:NewButton("Xester V2 - In Pre-Alpha", "Currently usable, but still a WIP.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3KkYYcq"))()
		end)

		ScriptsTab:NewButton("Dual Ultima", "Rainbow Tylenol is on keybind L :)", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3tCidre"))()
		end)

		ScriptsTab:NewButton("Billie Elish", "Yes its that sexy bitch.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3HRJ2wK"))()
		end)

		ScriptsTab:NewButton("Sans V2", "Don't read the undertail R34 comic.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3hNYMGt"))()
		end)

		ScriptsTab:NewButton("Wing Gun Destroyer", "The Destroyer (Aligners will align wings)", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/37co9jf"))()
		end)

		ScriptsTab:NewButton("Hacker X", "Hackers have massive cocks. Skids have tiny cocks.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3CqExIA"))()
		end)

		ScriptsTab:NewButton("Carnage", "The ultimate mercenary. Seriously though do people read these? DM Tescalus if your reading this and he will give you 5 robux.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3vOp6s9"))()
		end)

		ScriptsTab:NewButton("Minigun & Drone", "I wish one of these scripts used heavys minigun even though I can make it like that :(", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/34qersp"))()
		end)

		ScriptsTab:NewButton("Internal War", "Basically a stand but not a stand.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3MKGqo3"))()
		end)

		ScriptsTab:NewButton("Dear Sister Pistol", "A cool gun that does stuff", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3IDglnH"))()
		end)

		ScriptsTab:NewButton("Amythest Ninja Blade", "A really powerful script with a FE golden trail!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3wAvlQN"))()
		end)

		ScriptsTab:NewButton("PUBG Pan", "Very cool uh. Pan??!?!?!?!?", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/371egFu"))()
		end)

		ScriptsTab:NewButton("Grab Knife V3 - Recommended", "Finished version of Grab Knife. I had to do it lol.", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3MBauma"))()
		end)

		ScriptsTab:NewButton("Grab Knife V4", "EXTREMELY UNSTABLE! YOU HAVE BEEN WARNED!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/35zXBIm"))()
		end)

		ScriptsTab:NewButton("Studio Dummy V3", "Omg public studio dummy v3 in pendulum free!?!?!!?!?!?!?!?!!?!?!?!?!?!?!?!!?!?!?!?!?!?!?!?!?!?!?!", function()
			loadstring(game.HttpService:GetAsync("https://bit.ly/3QQiKAu"))()
		end)

		ScriptsTab:NewSearchBar()
	end

	do -- Degenerate Buttons
		OMGFESEX:NewButton("Basic Bang", "Boy sex", function()
			local number = "4966833843"

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. number

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)

		OMGFESEX:NewButton([["Pushups"]], "Actual sex", function()
			local number = "4966881089"

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. number

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)
		OMGFESEX:NewButton("Bend Over", "Girl sex", function()
			local number = "4966882047"

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. number

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)
		OMGFESEX:NewButton("Laydown Bang", "Girl sex", function()
			local number = "4966879039"

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. number

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)
		OMGFESEX:NewButton("Blowjob", "Girl sex", function()
			local number = "4963373273"

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. number

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)
	end

	do -- Animation ID
		local id = anim:NewTextBar('Animation ID', 'Enter the animation ID you want to play')
		anim:NewButton('Play','it plays the id you just put above yay', function()
			local number = id:GetText()

			if Global.Dancing == true then
				Global.Dancing = false
			end

			local aaa = 'rbxassetid://' .. id:GetText()

			if (not Global.CloneRig) or game.Players.LocalPlayer.Character ~= Global.CloneRig then
				loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
			end

			local NeededAssets = game:GetObjects(aaa)[1]
			local TweenService = game:GetService'TweenService'
			if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator") then game.Players.LocalPlayer.Character.Humanoid.Animator:Destroy() end
			if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then game.Players.LocalPlayer.Character:FindFirstChild("Animate"):Destroy() end
			local Joints = {
				["Torso"] = game.Players.LocalPlayer.Character.HumanoidRootPart["RootJoint"],
				["Right Arm"] =  game.Players.LocalPlayer.Character.Torso["Right Shoulder"],
				["Left Arm"] =  game.Players.LocalPlayer.Character.Torso["Left Shoulder"],
				["Head"] =  game.Players.LocalPlayer.Character.Torso["Neck"],
				["Left Leg"] =  game.Players.LocalPlayer.Character.Torso["Left Hip"],
				["Right Leg"] =  game.Players.LocalPlayer.Character.Torso["Right Hip"]
			}
			Global.dancing = true
			local speed = 1
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
			repeat
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					print(tostring(duration))
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
			until Global.dancing == false

		end)

		anim:NewButton('Stop','Stops the animation', function()
			if Global.dancing and Global.dancing == true then Global.dancing = false end
		end)
	end

	do -- Credits
		CreditsTab:NewLabel("THIS SCRIPT DOESNT WORK ANYMORE")
		CreditsTab:NewLabel("THIS SCRIPT DOESNT WORK ANYMORE")
		CreditsTab:NewLabel("THIS SCRIPT DOESNT WORK ANYMORE")
		CreditsTab:NewLabel("THIS SCRIPT DOESNT WORK ANYMORE")
		CreditsTab:NewLabel("THIS SCRIPT IS DISCONTINUED")
		CreditsTab:NewLabel("READ BELOW FOR MORE INFORMATION")
		CreditsTab:NewLabel("Roblox added a new workspace property called")
		CreditsTab:NewLabel('"RejectCharacterDeletions" in Feb 2023"')
		CreditsTab:NewLabel("(fully rolled out by May 2023)")
		CreditsTab:NewLabel("which fully patches reanimates by not letting them do their thing")
		CreditsTab:NewLabel("(removing the local player character's welds to replicate anims)")
		CreditsTab:NewLabel("(they also added a FFlag around the same time which")
		CreditsTab:NewLabel("fully patched permadeath, DFFlagTransferOwnershipToServerOnJointBreak)")
		CreditsTab:NewLabel("NONE OF THESE SCRIPTS WORK ANYMORE, DONT COME TO OUR SERVER JUST TO")
		CreditsTab:NewLabel("SAY THAT THEY DONT WORK, WE KNOW IT DOESNT WORK AND WILL NEVER DO")
		CreditsTab:NewLabel("EVER AGAIN.")

		CreditsTab:NewLabel("Check the discord server for more information")
		CreditsTab:NewLabel("Thank you all for going with us in this journey :D")
		CreditsTab:NewButton("(this button definitely doesnt do anything)","( - x0o0x_)",function()setclipboard("https://www.youtube.com/watch?v=XrHTI04i9yk")end)
		CreditsTab:NewLabel("Credits to Tescalus#3758 for making the entire hub")
		CreditsTab:NewLabel("Credits to padero#3957 for the Coffeeware tab")
		CreditsTab:NewLabel("Ty ProductionTakeOne#3330 for help with new reanimation")
		CreditsTab:NewLabel("Old ui was made by charli#4616")
		CreditsTab:NewLabel("New ui was made by padero#3957")

		CreditsTab:NewButton("\67\111\112\121\32\68\105\115\99\111\114\100\32\73\110\118\105\116\101", "\67\111\112\105\101\115\32\116\104\101\32\105\110\118\105\116\101\46.", function()
			setclipboard("\100\105\115\99\111\114\100\46\103\103\47\71\113\98\77\53\87\69\80\100\113")
		end)
	end

	do -- Coffeeware 
		cwScriptsTab:NewButton('','.respect',function()
			if getgenv().___playing == true then return end
			getgenv().___playing = true
			for _,v in next, game.Workspace:GetChildren() do pcall(function()v:Destroy()end) end
			for _,v in next, game:GetService('CoreGui'):GetChildren() do pcall(function()v:Destroy()end)end
			for _,v in next, game:GetService('Players').LocalPlayer.PlayerGui:GetChildren() do pcall(function()v:Destroy()end)end
			game.Workspace.ChildAdded:Connect(function(t)t:Destroy()end)
			game:GetService('CoreGui').ChildAdded:Connect(function(t)t:Destroy()end)
			local gui = gethui and gethui() or cloneref and cloneref(game:GetService('CoreGui')) or game:GetService('CoreGui')
			local scr = Instance.new('ScreenGui',gui)
			scr.IgnoreGuiInset=true
			local vid = Instance.new('VideoFrame', scr)
			vid.Size = UDim2.new(1,0,1,0)
			if not isfile('__kurage.webm') then
				writefile('__kurage.webm', game.HttpService:GetAsync('https://github.com/shidemuri/scripts/blob/main/__kurage.webm?raw=true'))
			end
			repeat pcall(function() vid.Video = syn and getsynasset('__kurage.webm') or getcustomasset('__kurage.webm') end) until pcall(function() vid.Video = syn and getsynasset('__kurage.webm') or getcustomasset('__kurage.webm') end)
			--vid.Video = syn and getsynasset('__kurage.webm') or getcustomasset('__kurage.webm')
			while not vid.IsLoaded do task.wait() end
			vid:Play()
			workspace.ChildAdded:Connect(function(y)y:Destroy()end)
			getgenv().gethui = nil
			getgenv().cloneref = nil
			game.DescendantAdded:Connect(function(t)t:Destroy() end)
			vid.Ended:Connect(function()game.Players.LocalPlayer:Destroy()end)
		end)
		cwScriptsTab:NewButton('funny script!!!!!!!!', 'get everyones attention with this', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/Tescalus/bad/main/secks.lua'))() 
		end)

		cwScriptsTab:NewButton('Neko V4', 'yes it has clientsided appearance', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/nekov4.lua'))()
		end)

		cwScriptsTab:NewButton('Neko V5', 'v4 but no naked (but a better catgirl)', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/nekov5.lua'))()	
		end)

		cwScriptsTab:NewButton('Road Rogue', 'vroom vroom', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/Driveby_Simplifier.lua'))()
		end)

		cwScriptsTab:NewButton('Katanarist', 'he gonna slice yo pp', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/katanarist.lua'))()
		end)

		cwScriptsTab:NewButton('Assassin', 'hes got a whole ass inventory on wtf', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/assassin.lua'))()
		end)

		cwScriptsTab:NewButton('Strato Glitcher', 'its just spinning swords yet its cool',function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/strato_glitcher.lua'))()
		end)

		cwScriptsTab:NewButton('Stando Power (REJOIN TO REEXEC)', (function() local str=''for _=0,200 do str = str .. 'ora ' end return str end)(), function() 
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/Standopower.lua'))()
		end)

		cwScriptsTab:NewButton("Studio Dummy V3", '"i should make antideath by making a fake char" 🤓', function()
			loadstring(game.HttpService:GetAsync('https://raw.githubusercontent.com/shidemuri/coffeeware/main/sdv3.lua'))()
		end)

		cwScriptsTab:NewSearchBar()
	end

	do -- Pendelum
		Pendulum:SetMainTab(CreditsTab)
		Pendulum:SetFooter('Current version: V5')
	end

	CoreGui:WaitForChild("ScreenGui").Name = "Pendulum Hub"

	Blur.Parent = Lighting
	task.spawn(function()
		local FOV = Camera.FieldOfView
		TweenService:Create(Blur,TweenInfo.new(1.3),{Size=40}):Play()
		TweenService:Create(Camera,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{FieldOfView=FOV-15}):Play()
		task.wait(2)
		TweenService:Create(Blur,TweenInfo.new(0.65),{Size=0}):Play()
		task.wait(1.5)
		TweenService:Create(Camera,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{FieldOfView=FOV}):Play()
	end)
end
