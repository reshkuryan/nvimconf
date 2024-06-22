-- Cmdline
local api = vim.api
api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },
  popup = {
    position = {
      row = '10%',
      col = '50%',
    },
    border = {
        text = {
      top = "[Hi]",
      top_align = "center",
    },
    },
    size = {
      width = '50%',
    },
      win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      -- code
    end
  }
})
