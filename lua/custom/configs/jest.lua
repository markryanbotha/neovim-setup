require("jester").setup({
  cmd = "./node_modules/.bin/jest -t '$result' -- $file", -- run command
})
