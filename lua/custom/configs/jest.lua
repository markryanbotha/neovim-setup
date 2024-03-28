require("jester").setup {
  cmd = "./node_modules/.bin/jest -t '$result' -- $file", -- run command
  terminal_cmd = "terminal",                              -- This will only open a terminal in a new tabufline tab, so I don't have to exit the window every time
}
