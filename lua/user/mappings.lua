local telescope_ok, telescope = pcall(require, "telescope")

local maps = {
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

if telescope_ok then return maps end
local previewers = require "telescope.previewers"
local builtin = require "telescope.builtin"

local delta_commits = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }

    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
  end,
}

local delta_status = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
  end,
}

local git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta_commits

  builtin.git_commits(opts)
end

local git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta_status

  builtin.git_status(opts)
end

maps.n["<leader>gc"] = { git_commits, desc = "Git commits" }
maps.n["<leader>gt"] = { git_status, desc = "Git status" }

return maps
