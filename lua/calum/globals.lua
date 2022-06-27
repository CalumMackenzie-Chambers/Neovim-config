vim.g.is_win = (vim.loop.os_uname().version:match 'Windows') and true or false
vim.g.is_linux = (vim.loop.os_uname().sysname == "Linux")  and true or false
vim.g.is_mac = (vim.loop.os_uname().sysname == "Darwin") and true or false
vim.g.logging_level = 'info'
vim.g.loaded_perl_provider = 0

if (vim.api.nvim_eval("g:is_win")) then
    vim.g.python3_host_prog = "C:\\Program Files\\Python310\\python.exe"
end
