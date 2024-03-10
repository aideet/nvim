local options = {
    keywords = {
    FIXME = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "Fixme", "fixme", "BUG", "Bug", "bug", "HACK", "hack" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info", alt = { "Todo", "todo" } },
    -- HACK = { icon = " ", color = "warning", alt = { "hack" } },
    -- WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    -- PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    -- NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    -- TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
}

return options
