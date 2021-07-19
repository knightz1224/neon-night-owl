local colors = {
    gray = "#7e8294",
    gray_alt = "#4C566A",
    red = "#fc514e",
    yellow = "#e3d18a",
    orange = "#f78c6c",
    green = "#a1cd5e",
    cyan = "#7fdbca",
    dark_cyan = "#21c7a8",
    blue = "#82aaff",
    violet = "#c792ea",
    purple = "#ae81ff",
    light_blue = "#82AAFF",
    light_pink = "#D8BFD8",
    disabled = "#676E95",
    diff_red = "#fc514e",
    diff_green = "#a1cd5e",
    diff_blue = "#82aaff",
    diff_yellow = "#e3d18a",
    watermelon = "#ff5874",
    tan = "#ecc48d",
    indigo = '#5e97ec',
    black_blue = "#081e2f",
    dark_blue  = "#092236",
    deep_blue  = "#0e293f",
    slate_blue = "#2c3043",
    regal_blue = "#1d3b53",
    cyan_blue  = "#296596",
    steel_blue = "#4b6479",
    grey_blue  = "#7c8f8f",
    cadet_blue = "#a1aab8",
    white_blue = "#d6deeb",
    none = "NONE"
}

function colors.generate()
    if vim.g.neon_style == "default" or vim.g.neon_style == "" then
        colors.fg = "#c5cdd9"
        colors.bg0 = "#2b2d37"
        colors.bg1 = "#333644"
        colors.bg2 = "#363a49"
        colors.bg3 = "#3a3e4e"
        colors.bg4 = "#404455"
    elseif vim.g.neon_style == "night_owl" then
        colors.fg = "#c3ccdc"
        colors.bg0 = "#011627"
        colors.bg1 = "#"
        colors.bg2 = "#1c1f24"
        colors.bg3 = "#3f444a"
        colors.bg4 = "#23272e"
    elseif vim.g.neon_style == "doom" then
        colors.fg = "#bbc2cf"
        colors.bg0 = "#282c34"
        colors.bg1 = "#202328"
        colors.bg2 = "#1c1f24"
        colors.bg3 = "#3f444a"
        colors.bg4 = "#23272e"
    elseif vim.g.neon_style == "dark" then
        colors.fg = "#c5cdd9"
        colors.bg0 = "#0d1117"
        colors.bg1 = "#161b22"
        colors.bg2 = "#21262d"
        colors.bg3 = "#333644"
        colors.bg4 = "#363a49"
    elseif vim.g.neon_style == "light" then
        colors.fg = "#4C566A"
        colors.bg0 = "#d3d3d3"
        colors.bg1 = "#d0d0d0"
        colors.bg2 = "#c2c2c3"
        colors.bg3 = "#a0a1a7"
        colors.bg4 = "#abb2bf"
        colors.red = "#ff6655"
        colors.yellow = "#c18401"
        colors.orange = "#da8548"
        colors.green = "#50a14f"
        colors.cyan = "#0997b3"
        colors.dark_cyan = "#5699AF"
        colors.blue = "#2257A0"
        colors.violet = "#9370DB"
        colors.purple = "#a626a4"
        colors.light_blue = "#528bff"
        colors.light_pink = "#8A2BE2"
        colors.disabled = "#676E95"
        colors.diff_red = "#55393d"
        colors.diff_green = "#394634"
        colors.diff_blue = "#354157"
        colors.diff_yellow = "#4e432f"
    end
end

return colors
