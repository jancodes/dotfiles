return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
        ["yp"] = {
          callback = function()
            local entry = require("oil").get_cursor_entry()

            local dir = require("oil").get_current_dir()

            if not entry or not dir then
              return
            end

            local relpath = vim.fn.fnamemodify(dir, ":.")

            vim.fn.setreg("+", relpath .. entry.name)
          end,

        },
      },
      view_options = {
        show_hidden = true,
      }
    })

    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end
}
