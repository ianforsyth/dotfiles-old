local status_ok, workspaces = pcall(require, "workspaces")
if not status_ok then
	return
end

local file_exists = function(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local set_working_directory = function()
  vim.cmd('cd '..vim.fn.expand('%h'))
end

local create_session = function()
  vim.cmd('silent mksession! .session.vim')
end

local load_session = function()
  if file_exists('.session.vim') then
    os.execute('grep -v "argadd" .session.vim > .tmp_session.vim') -- Removing the launch argument to prevent an extra buffer
    os.execute('mv .tmp_session.vim .session.vim')
    vim.cmd('silent bufdo bw') -- Close all currently open buffers
    vim.cmd('source .session.vim')
  end
end

local save_session = function()
  if file_exists('.session.vim') then
    create_session()
  end
end


vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  callback = function ()
    set_working_directory()
    load_session()
  end,
})

vim.api.nvim_create_autocmd({"VimLeavePre"}, {
  pattern = {"*"},
  callback = save_session,
})

vim.api.nvim_create_user_command("WList", "WorkspacesList", {})
vim.api.nvim_create_user_command("WAdd", "WorkspacesList", {})
vim.api.nvim_create_user_command("WRemove", "WorkspacesRemove", {})
vim.api.nvim_create_user_command("WRename", "WorkspacesRename", {})

workspaces.setup({
  hooks = {
    add = create_session,
    open_pre = save_session,
    open = load_session,
  }
})
