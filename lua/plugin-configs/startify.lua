
vim.g.startify_lists = {
  { type = "commands", header = { "    Commands" } }, -- Commands from above
  { type = "sessions",  header = {"   Sessions"} },
  -- { type = "files", header = {" Files"} },
  { type = "dir", header = { "   MRU " .. vim.fn.getcwd() } }, -- MRU files from CWD
  { type = "bookmarks", header = {"   Bookmarks"} },
}

