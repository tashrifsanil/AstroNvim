return {
  n = {
    -- Abolish Coercion Reference
    ["cr?"] = { ":help abolish-coercion<cr>", desc = "Help" },
    ["crc"] = "camelCase",
    ["crm"] = "MixedCase",
    ["cr_"] = "snake_case",
    ["crs"] = "snake_case",
    ["cru"] = "SNAKE_UPPERCASE",
    ["crU"] = "SNAKE_UPPERCASE",
    ["cr-"] = "dash-case",
    ["crk"] = "kebab-case",
    ["cr."] = "dot.case",
    ["cr<space>"] = "space",
    ["crt"] = "Title",
    -- Multiple cursors mg979/vim-visual-multi
    ["<c-k>"] = { ":call vm#commands#add_cursor_up(0, v:count1)<cr>", desc = "Add cursor up" },
    ["<c-j>"] = { ":call vm#commands#add_cursor_down(0, v:count1)<cr>", desc = "Add cursor down" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Quick Save" }, -- change description but the same command
  },
  v = {
    -- Search for visually selected text
    -- https://vim.fandom.com/wiki/Search_for_visually_selected_text
    ["//"] = { "y/<C-R>=escape(@\",'/')<cr><cr>", desc = "Search visually selected" },
  },
}
