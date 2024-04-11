return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    -- Build and return the Azure DevOps url.
    ---@param url_data table
    ---@return string
    local function get_azure_devops_url(url_data)
      if url_data.host == 'ssh.dev.azure.com' then
        -- Add the `_git` value right before the repository which is after the last
        -- forward slash. This is already present if the host is `https`. Also,
        -- remove the `v3/` part at the beginning which is the ssh version for
        -- Azure DevOps.
        url_data.repo = url_data.repo:gsub('/([^/]+)$', '/_git/%1'):gsub('^v3/', '')
      end

      local url = 'https://dev.azure.com/' .. url_data.repo
      if not (url_data.file and url_data.rev) then
        return url
      end

      url = ('%s?version=GC%s&path=%s'):format(url, url_data.rev, url_data.file)
      if not url_data.lstart then
        return url
      end

      if not url_data.lend then
        url = ('%s&line=%d&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents'):format(
          url,
          url_data.lstart
        )
        return url
      end

      url = ('%s&line=%d&lineEnd=%d&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents'):format(
        url,
        url_data.lstart,
        url_data.lend + 1
      )

      return url
    end

    require "gitlinker".setup({
      callbacks = {
        ["dev.azure.com"] = get_azure_devops_url,
      },
      opts = {
        remote = nil, -- force the use of a specific remote
        -- adds current line nr in the url for normal mode
        add_current_line_on_normal_mode = true,
        -- callback for what to do with the url
        action_callback = require "gitlinker.actions".copy_to_clipboard,
        -- print the url after performing the action
        print_url = true,
      },
      -- default mapping to call url generation with action_callback
      mappings = "<leader>gl"
    })
  end
}
