local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")
local dashboard_custom_headerTransformer = {
	  "              ▄▄▄▄▄▄▄▄▄              ",
	  "           ▄█████████████▄           ",
	  "   █████  █████████████████  █████   ",
	  "   ▐████▌ ▀███▄       ▄███▀ ▐████▌   ",
	  "    █████▄  ▀███▄   ▄███▀  ▄█████    ",
	  "    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ",
	  "     ███▄▀███▄  ▀███▀  ▄███▀▄███     ",
	  "     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌     ",
	  "      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ",
	  "       ▀███▄▀██ █████ ██▀▄███▀       ",
	  "      █▄ ▀█████ █████ █████▀ ▄█      ",
	  "      ███        ███        ███      ",
	  "      ███▄    ▄█ ███ █▄    ▄███      ",
	  "      █████ ▄███ ███ ███▄ █████      ",
	  "      █████ ████ ███ ████ █████      ",
	  "      █████ ████▄▄▄▄▄████ █████      ",
	  "       ▀███ █████████████ ███▀       ",
	  "         ▀█ ███ ▄▄▄▄▄ ███ █▀         ",
	  "            ▀█▌▐█████▌▐█▀            ",
	  "               ███████               ",
  }

local dashboard_custom_headerSuperMan = {
   "        ▄▄▄▄▄███████████████████▄▄▄▄▄       ",
   "      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄     ",
   "     █▀████████▄             ▀▀████ ▀██▄    ",
   "    █▄▄██████████████████▄▄▄         ▄██▀   ",
   "     ▀█████████████████████████▄    ▄██▀    ",
   "       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀      ",
   "         ▀███▄              ▀██████▀        ",
   "           ▀██████▄        ▄████▀           ",
   "              ▀█████▄▄▄▄▄▄▄███▀             ",
   "                ▀████▀▀▀████▀               ",
   "                  ▀███▄███▀                 ",
   "                     ▀█▀                    ",
   }

--local dashboard_custom_headerDoom ={
--"=================     ===============     ===============   ========  ========",
--"\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
--"||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||",
--"|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
--"||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
--"|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||",
--"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||",
--"|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||",
--"||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||",
--"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||",
--"||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||",
--"||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||",
--"||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||",
--"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||",
--"||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||",
--"||.=='    _-'                                                     `' |  /==.||",
--"=='    _-'                        N E O V I M                         \/   `==",
--"\   _-'                                                                `-_   /",
--" `''                                                                      ``'",
--}

local dashboard_custom_headerNvim = {
 " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
 " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
 " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
 " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
 " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
 " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

local dashboard_custom_headerHydra = {
	"",
	"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
	"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
	"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
	"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
	"          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
	"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
	"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
	" ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
	" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
	"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
	"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
	"     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
	"     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
	"     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
	"",
	}

local dashboard_custom_headerKfm = {
	  "     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ",
	  "   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ",
	  "   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ",
	  "   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ",
	  "   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ",
	  "   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ",
	  "   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ",
	  "   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ",
	  "   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ",
	  "   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ",
	  "   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ",
	  "   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ",
	  "   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ",
	  "   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ",
	  "   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ",
	  "   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ",
	   }


local dashboard_custom_headerSun = {
  "                      ▄█         ",
  "                    ▄██░█         ",
  "            ██    ██░░░░█         ",
  "           ██░░█ █░░░░░░█         ",
  "          ▄█░░░███░░░░░██         ",
  "          █░░░░█░░░░░░██████████▀ ",
  "          █░░░░▄▄▄▄▄░░░░░░░░░░█   ",
  "   ▀███████░▐░░░░░░░░░▌░░░░░█     ",
  "     ██░░░░▐░░▄██████████▄░█      ",
  "      █░░░░▌▄███████▀▀▀▀█▀█▀      ",
  "      ██░░▄▄████████░░░░▌░██      ",
  "       █▐██████▌███▌░░░░▐░░██     ",
  "        ██▌████▐██▐░░░░░▐░░░░██   ",
  "       █▐█▐▌█▀███▀▀░░░░░▐░░░░░██  ",
  "      █░░██▐█░░▄░░░▄█░░░▐░░░░░░██ ",
  "     █░░░▐▌█▌▀▀░░░█░█▌░░▐░░░░████ ",
  "    █░░░░▐▀▀░░░░▄█░░█▌░░▌░░███    ",
  "  ▄██░░░░░▌░░░▄██░▄██▌░▐░███      ",
  "     ██░░░▐░░▀█▄░▄███▌░▐░░█       ",
  "      ███░░█░░░██▀▀░█░░▌░░░█      ",
  "        █░░░▌░░▐█████░▐░░░░██     ",
  "       █░░░░░▀▄▄░░░░░█░░░░░░██    ",
  "      ██░░░░░░░░▀▄▄▄▀░░████████▄  ",
  "      █░█████░░░░░█░░░░█          ",
  "      ██    ██░░░░██░░░█          ",
  "      █      █░░░█ ███░░█         ",
  "             █░░░█   ██░█         ",
  "             █░░░█     ██         ",
  "               █░█                ",
   }

local dashboard_custom_headerPkq ={
	"          ▀████▀▄▄              ▄█ ",
	"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
	"    ▄        █          ▀▀▀▀▄  ▄▀  ",
	"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
	"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
	"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
	"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
	"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
	"   █   █  █      ▄▄           ▄▀   ",
	}

local dashboard_custom_headerXx ={
  "                 ▄████████▄         ",
  "               ▄█▀▒▒▒▒▒▒▒▀██▄       ",
  "           ▄█▀▒▒▒▒▒▒▄▒▒▒▒▒▒▐█▌      ",
  "         ▄█▒▒▒▒▒▒▒▒▒▒▀█▒▒▒▄██       ",
  "       ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▀▒▒▒█▄     ",
  "     ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▄   ",
  "     ▄█▒▒▒▄██████▄▒▒▒▒▄█████▄▒▒▒▒█  ",
  "     █▒▒▒█▀░░░░░▀█ ▒▒▒█▀░░░░▀█▒▒▒█  ",
  "     █▒▒▒█░░▄░░░░▀████▀░░░▄░░█▒▒▒█  ",
  "   ▄███▄▒█▄░▐▀▄░░░░░░░░░▄▀▌░▄█▒▒███▄",
  "   █▀░░█▄▒█░▐▐▀▀▄▄▄ ▄▄▄▀▀▌▌░█▒▒█░░▀█",
  "   █░░░░█▒█░▐▐  ▄▄ █ ▄▄  ▌▌░█▒█░░░░█",
  "   █░▄░░█▒█░▐▐▄ ▀▀ █ ▀▀ ▄▌▌░█▒█░░▄░█",
  "   █░░█░█▒█░░▌▄█▄▄▀ ▀▄▄█▄▐░░█▒█░█░░█",
  "   █▄░█████████▀░░▀▄▀░░▀█████████░▄█",
  "   ██▀░░▄▀░░▀░░▀▄░░░▄▀░░▀░░▀▄░░▀██  ",
  "   ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██",
  "   █░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░▄░█",
  "   █░▀█▄░░░░░░░░░░░░░░░░░░░░░░░▄█▀░█",
  "   █░░█▀███████████████████████▀█░░█",
  "   █░░█    █   █   █   █   █    █░░█",
  "   █░░░▀█▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄█▀░░░█",
  "   ▀█░░▀█▄█    █   █   █   █▄█▀░░░█▀  ",
  "    ▀█░░░▀▀█▄▄ █   █   █▄▄█▀▀░░░░█▀  ",
  "     ▀█░░░░░▀▀█████████▀▀░░░░░░█▀    ",
  "      ▀█░░░░░░░▄░░░░░░░▄░░░░░░█▀    ",
  "        ▀██▄░░░▀▀▀▀▀▀▀▀▀░░░▄██▀      ",
  "          ▀██▄▄░░░░░░░▄▄██▀        ",
  "             ▀▀███████▀▀            ",
}


local dashboard_custom_headerGirl ={
	"    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀  ",
	"    ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀  ",
	"    ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀  ",
	"    ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀  ",
	"    ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀  ",
	"    ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀  ",
	"    ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ",
	"    ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ",
	"    ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁  ",
	"    ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀  ",
	"    ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀  ",
	"    ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀  ",
	"    ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀  ",
	"    ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀  ",
	"    ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀  ",
	"    ⣸⠀⡇⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀⠁⠀⢸⠀⠀  ",
	"    ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀  ",
	"    ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀  ",
	"    ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧  ",
	"    ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  ",
	}

local dashboard_custom_headerCes ={
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ",
	"⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ",
	"⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ",
	"⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ",
	"⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ",
	"⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ",
	"⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ",
	}

local dashboard_custom_headerLamda = {
	"",
	 "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	 "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
	 "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
	 "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
	 "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
	 "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
	 "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
	 "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
	 "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
	 "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
	 "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
	 "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
	 "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
	 "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
	 "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	 }

local conf = {}
conf.header = dashboard_custom_headerTransformer
--conf.header = {
  --"                                                       ",
  --"                                                       ",
  --"                                                       ",
  --" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  --" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  --" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  --" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  --" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  --" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  --"                                                       ",
  --"                                                       ",
  --"                                                       ",
  --"                                                       ",
--}

 --conf.week_header = {
       --enable = true,
 --}

conf.center = {
  {
    icon = "$  ",
    desc = "Session loader                          ",
    action = "LoadSession ",
    key = "LoadSession",
  },
  {
    icon = "󰈞  ",
    desc = "Find  File                              ",
    action = "Leaderf file --popup",
    key = "<Leader> f f",
  },
  {
    icon = "󰈢  ",
    desc = "Recently opened files                   ",
    action = "Leaderf mru --popup",
    key = "<Leader> f r",
  },
  {
    icon = "󰈬  ",
    desc = "Project grep                            ",
    action = "Leaderf rg --popup",
    key = "<Leader> f g",
  },
  {
    icon = "  ",
    desc = "Open Nvim config                        ",
    action = "tabnew $MYVIMRC | tcd %:p:h",
    key = "<Leader> e v",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    key = "e",
  },
  {
    icon = "󰗼  ",
    desc = "Quit Nvim                               ",
    -- desc = "Quit Nvim                               ",
    action = "qa",
    key = "q",
  },
}

dashboard.setup({
  theme = 'doom',
  shortcut_type = 'number',
  config = conf
})

api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})