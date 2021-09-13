local colors = {
    bg0 = '#011627',
    bg3 = '#011627',
    -- bg = '#292D38',
    yellow = '#ECBE7B',
    dark_yellow = '#D7BA7D',
    cyan = '#008080',
    green = '#608B4E',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FF8800',
    purple = '#C586C0',
    magenta = '#D16D9E',
    grey = '#858585',
    blue = '#51AFEF',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#EC5F67',
    error_red = '#F44747',
    info_yellow = '#FFCC66'
}

local neon = {
    visual = {
        a = {fg = colors.bg0, bg = colors.purple, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3}
    },
    replace = {
        a = {fg = colors.bg0, bg = colors.cyan, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3}
    },
    inactive = {
        a = {fg = colors.fg, bg = colors.bg3, gui = "bold"},
        b = {fg = colors.fg, bg = colors.bg3},
        c = {fg = colors.fg, bg = colors.bg3}
    },
    normal = {
        a = {fg = colors.bg0, bg = colors.blue, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3},
        c = {fg = colors.blue, bg = colors.bg3}
    },
    insert = {
        a = {fg = colors.bg0, bg = colors.green, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3}
    },
    command = {
        a = {fg = colors.bg0, bg = colors.magenta, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3}
    },
}

return neon
