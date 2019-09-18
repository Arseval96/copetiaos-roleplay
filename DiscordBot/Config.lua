DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/584262972055224323/CBtrBwWMM_JRilM5ETnyaL8__UvUNgcBh3u3JRFcdLV9f4X0OGGzB6Ze8Dx5FSmNO2nw'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/584262888051703829/Sc-h6tJK4rG_tNbL5fXD21HyGsZAS5nT4oCcD4Mh5rLBEYjojFH74xQqyuAKnMW3HjuP'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/584262287771041802/YOc2jobCM9-wvgBf4CZWOWx-anzsb3mpjuGgh3On1V0SJ65mX9r-qBoPbMD3wvtEgLL_'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'SYSTEM'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

