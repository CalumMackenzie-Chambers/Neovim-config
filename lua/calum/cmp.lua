local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 30
local MIN_LABEL_WIDTH = 30

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {
    "i",
    "s",
}),
  },

  formatting = {
      fields = { "abbr", "kind" },
      format = function(_, vim_item)
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          local label = vim_item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          if truncated_label ~= label then
              vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
          elseif string.len(label) < MIN_LABEL_WIDTH then
              local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
              vim_item.abbr = label .. padding
          end
          return vim_item
      end,
  },

  sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
  },

  confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
  },

  window = {
      documentation = cmp.config.window.bordered(),
  },

  experimental = {
      ghost_text = true,
  },
}

vim.api.nvim_set_hl(0, "CmpItemMenu", {link="Comment"})
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {bg="NONE", fg="#2E3440", strikethrough=true})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {bg="NONE", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {bg="NONE", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "CmpItemKindVariable", {bg="NONE", fg="#81A1C1"})
vim.api.nvim_set_hl(0, "CmpItemKindInterface", {bg="NONE", fg="#8FBCBB"})
vim.api.nvim_set_hl(0, "CmpItemKindText", {bg="NONE", fg="#ECEFF4"})
vim.api.nvim_set_hl(0, "CmpItemKindFunction", {bg="NONE", fg="#88C0D0"})
vim.api.nvim_set_hl(0, "CmpItemKindMethod", {bg="NONE", fg="#88C0D0"})
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", {bg="NONE", fg="#81A1C1"})
vim.api.nvim_set_hl(0, "CmpItemKindProperty", {bg="NONE", fg="#81A1C1"})
vim.api.nvim_set_hl(0, "CmpItemKindUnit", {bg="NONE", fg="#ECEFF4"})

