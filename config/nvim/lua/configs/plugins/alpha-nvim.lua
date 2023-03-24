local M = {}
local alpha = require('alpha')
local startify = require('alpha.themes.startify')
local dashboard = require('alpha.themes.dashboard')

function M.setup()
	-- ======= Startify Settings =======
	startify.section.header.val = {
		[[                                 ╒                               ]],
		[[                    ,╓µµ,         ▓╕                             ]],
		[[                 ,P`      ,▀g    ,▓▐█▌,,                         ]],
		[[                ▄     ,▄▄░▄&▐▒░░▒▒▒▒▒▒░░░░░░▒N╖   ,∞═**═∞,       ]],
		[[                ▌   ▄▓▒▓▀░▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒░▀▓▒.      \"W    ]],
		[[                ▌  .▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒░▀⌂,      ╚⌐   ]],
		[[                ▐ ░▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▐▌▀▄     ▓   ]],
		[[                 ╙▓░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▐▌▒▌    ▓   ]],
		[[           \     ▐░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▐▓░░░░,▌   ]],
		[[         ,▄╗,    ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▌▌▀░▄░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀w░░▄▀    ]],
		[[    \`~   ▌░░⌠▀⌠F ▓▒▒▒▒▒▒▒▒▒▒▒▒░╝▐▀  ▄▓▌▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓╜      ]],
		[[       ` ╙▀░░░░▐ ╘W▒▒▒▒▒▒▒▒░Å╜         ▀^▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒⌐       ]],
		[[          ▀╩╩æ╩   ▀░▒▒░▄P╩▀▄               ▀▄▒▒▒▒░▒▒▒▒▒▒▒U       ]],
		[[                   ▀▄▓▒` ╧   ╦        └▄ ` ╙╙▀▄░▒▒▒▒▒▒▒▒▐        ]],
		[[          ╓▄        ▐`  ██⌐  ▐       ▀▀    ⁿ∞  ▀▀▌▒▒▒▒▒▒▌  ╓╦B▓  ]],
		[[       ▐░▐░░▀┐      ╙J       ▀       ▓   ▐██⌐   M\"█╩▄▒░▀ \"▀▓▄▓▓]],
		[[        ▐▌╔φ▐    Æ&. ▓¥,,,,Æ`        ▐         Æ  ▌▌ Ü` ,Æ▐▓▓▓`  ]],
		[[         ▀∞     \"╚╩` ▐       ▐µ    ▄▄  ⁿ∞w,╓w∞╜     ▐▄Æ▓M╙▐▀    ]],
		[[   Tg                 ╙╦       ╓▀▒▀▒▐U          ▄███▓█▀          ]],
		[[   ░░▒        ,φ$Z` `""%IM-,     ╙╩╩▀        ,▄▀▀▄ë▀█▓,          ]],
		[[   ▄░U    ^   ▌═▓██     ``─░`└░TTMMMMm∞∞╤MMT▀▀ⁿ╨▀*╧Å▄█▓█▌═       ]],
		[[               ▀Ñ,                  ``````             ▀▀▄▄,     ]],
		[[        ╔░ ▄       ⁿ∞,      ▄▄▄▄╕ ▄▄▄▄▄▄          ▓▄▄▄▄▄▄▄▀`     ]],
		[[        \"\"\"`          ▓░    ,▄▄█▄   ▄█\"       ▄\ⁿ\"  ▀▀▀▀    ]],
		[[                     ╔          ▀  ▀          ▀                  ]],
		[[                                              ¬                  ]],
	}
	startify.section.top_buttons.val = {
		startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	}
	startify.section.bottom_buttons.val = {
		startify.button("q", "  Quit NVIM", ":qa<CR>"),
	}
	startify.section.footer = {
		type = "text",
		val = {
			[[+-----------------------------------------------------------------------------+]],
			[[| "To live is to suffer, to survive is to find some meaning in the suffering" |]],
			[[| ---- Fredrich Neitzsche                                                     |]],
			[[+-----------------------------------------------------------------------------+]],
		},
		opts = {
			hl = "Type",
			shrink_margin = false,
			-- wrap = "overflow";
		},
	}

	-- ======= Dashboard Settings =======
	-- Set header
	dashboard.section.header.val = {
		[[                                 ╒                               ]],
		[[                    ,╓µµ,         ▓╕                             ]],
		[[                 ,P`      ,▀g    ,▓▐█▌,,                         ]],
		[[                ▄     ,▄▄░▄&▐▒░░▒▒▒▒▒▒░░░░░░▒N╖   ,∞═**═∞,       ]],
		[[                ▌   ▄▓▒▓▀░▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒░▀▓▒.      \"W    ]],
		[[                ▌  .▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒░▀⌂,      ╚⌐   ]],
		[[                ▐ ░▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▐▌▀▄     ▓   ]],
		[[                 ╙▓░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▐▌▒▌    ▓   ]],
		[[           \     ▐░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▐▓░░░░,▌   ]],
		[[         ,▄╗,    ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▌▌▀░▄░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀w░░▄▀    ]],
		[[    \`~   ▌░░⌠▀⌠F ▓▒▒▒▒▒▒▒▒▒▒▒▒░╝▐▀  ▄▓▌▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓╜      ]],
		[[       ` ╙▀░░░░▐ ╘W▒▒▒▒▒▒▒▒░Å╜         ▀^▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒⌐       ]],
		[[          ▀╩╩æ╩   ▀░▒▒░▄P╩▀▄               ▀▄▒▒▒▒░▒▒▒▒▒▒▒U       ]],
		[[                   ▀▄▓▒` ╧   ╦        └▄ ` ╙╙▀▄░▒▒▒▒▒▒▒▒▐        ]],
		[[          ╓▄        ▐`  ██⌐  ▐       ▀▀    ⁿ∞  ▀▀▌▒▒▒▒▒▒▌  ╓╦B▓  ]],
		[[       ▐░▐░░▀┐      ╙J       ▀       ▓   ▐██⌐   M\"█╩▄▒░▀ \"▀▓▄▓▓]],
		[[        ▐▌╔φ▐    Æ&. ▓¥,,,,Æ`        ▐         Æ  ▌▌ Ü` ,Æ▐▓▓▓`  ]],
		[[         ▀∞     \"╚╩` ▐       ▐µ    ▄▄  ⁿ∞w,╓w∞╜     ▐▄Æ▓M╙▐▀    ]],
		[[   Tg                 ╙╦       ╓▀▒▀▒▐U          ▄███▓█▀          ]],
		[[   ░░▒        ,φ$Z` `""%IM-,     ╙╩╩▀        ,▄▀▀▄ë▀█▓,          ]],
		[[   ▄░U    ^   ▌═▓██     ``─░`└░TTMMMMm∞∞╤MMT▀▀ⁿ╨▀*╧Å▄█▓█▌═       ]],
		[[               ▀Ñ,                  ``````             ▀▀▄▄,     ]],
		[[        ╔░ ▄       ⁿ∞,      ▄▄▄▄╕ ▄▄▄▄▄▄          ▓▄▄▄▄▄▄▄▀`     ]],
		[[        \"\"\"`          ▓░    ,▄▄█▄   ▄█\"       ▄\ⁿ\"  ▀▀▀▀    ]],
		[[                     ╔          ▀  ▀          ▀                  ]],
		[[                                              ¬                  ]],
	}

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
		dashboard.button("z", "  > ZSH Settings", ":e ~/.zshrc | :cd %:p:h | pwd<CR>"),
		dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
	}

	-- Set footer
	--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
	--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
	--   ```init.lua
	--   return require('packer').startup(function()
	--       use 'wbthomason/packer.nvim'
	--       use {
	--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
	--           requires = {'BlakeJC94/alpha-nvim-fortune'},
	--           config = function() require("config.alpha") end
	--       }
	--   end)
	--   ```
	-- local fortune = require("alpha.fortune")
	dashboard.section.footer.val = {
		[[+-----------------------------------------------------------------------------+]],
		[[| "To live is to suffer, to survive is to find some meaning in the suffering" |]],
		[[| ---- Fredrich Neitzsche                                                     |]],
		[[+-----------------------------------------------------------------------------+]],
	}

	-- ======= Send config to alpha =======
	alpha.setup(dashboard.opts)
	-- alpha.setup(startify.config)
end

return M
