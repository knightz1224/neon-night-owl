local c = require("neon.colors")
local utils = require("neon.utils")
local cfg = require("neon.config").styles
local neon = {}

local function set_terminal_colors()
    vim.g.terminal_color_0  = c.regal_blue
    vim.g.terminal_color_1  = c.red
    vim.g.terminal_color_2  = c.green
    vim.g.terminal_color_3  = c.yellow
    vim.g.terminal_color_4  = c.blue
    vim.g.terminal_color_5  = c.violet
    vim.g.terminal_color_6  = c.turquoise
    vim.g.terminal_color_7  = c.cadet_blue
    vim.g.terminal_color_8  = c.grey_blue
    vim.g.terminal_color_9  = c.watermelon
    vim.g.terminal_color_10 = c.emerald
    vim.g.terminal_color_11 = c.tan
    vim.g.terminal_color_12 = c.blue
    vim.g.terminal_color_13 = c.purple
    vim.g.terminal_color_14 = c.turquoise
    vim.g.terminal_color_15 = c.white_blue
    if vim.g.neon_transparent then
        c.bg0 = "NONE"
    end
    vim.g.terminal_color_background = c.bg0
    vim.g.terminal_color_foreground = c.fg
end

local function set_groups()
    local groups = {
        -- Base
        -- Editor highlight groups
        Normal = {fg = c.fg, bg = c.bg0}, -- normal text and background color
        SignColumn = {fg = c.green, bg = c.bg0},
        EndOfBuffer = {fg = c.disabled}, -- ~ lines at the end of a buffer
        NormalFloat = {fg = c.cadet_blue, bg = c.bg0}, -- normal text and background color for floating windows
        FloatBorder = {fg = c.slate_blue, bg = c.bg0},
        ColorColumn = {fg = c.none, bg = c.black_blue}, --  used for the columns set with 'colorcolumn'
        Conceal = {fg = c.deep_blue}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = {fg = c.blue, bg = c.none, style = "reverse"}, -- the character under the cursor
        CursorIM = {fg = c.blue, bg = c.none, style = "reverse"}, -- like Cursor, but used when in IME mode
        lCursor = {fg = c.bg0, bg = c.cadet_blue},
        Directory = {fg = c.emerald, bg = c.none, style = cfg.bold}, -- directory names (and other special names in listings)
        DiffAdd = {fg = c.diff_green, bg = c.none, style = "reverse"}, -- diff mode: Added line
        DiffChange = {fg = c.diff_blue, bg = c.none, style = "reverse"}, --  diff mode: Changed line
        DiffDelete = {fg = c.diff_red, bg = c.none, style = "reverse"}, -- diff mode: Deleted line
        DiffText = {fg = c.fg, bg = c.none, style = "reverse"}, -- diff mode: Changed text within a changed line
        ErrorMsg = {fg = c.red}, -- error messages
        Folded = {fg = c.green, bg = c.dark_blue, style = "italic"},
        FoldColumn = {fg = c.green, bg = c.slate_blue},
        IncSearch = {fg = c.peach, bg = c.bg0, style = "reverse"},
        LineNr = {fg = c.steel_blue},
        CursorColumn = {fg = c.none, bg = c.dark_blue},
        CursorLine = {fg = c.none, bg = c.dark_blue},
        CursorLineNr = {fg = c.blue, bg = c.dark_blue},
        MatchParen = {bg = c.bg0, style = "underline,bold"},
        ModeMsg = {fg = c.cadet_blue, style = cfg.bold},
        MoreMsg = {fg = c.red, style = cfg.bold},
        NonText = {fg = c.orange},
        Pmenu = {fg = c.fg, bg = c.deep_blue},
        PmenuSel = {fg = c.bg0, bg = c.cyan_blue, style = "bold"},
        PmenuSbar = {fg = c.fg, bg = c.deep_blue},
        PmenuThumb = {fg = c.fg, bg = c.steel_blue},
        Question = {fg = c.green, style = cfg.bold},
        Whitespace = {fg = c.deep_blue},
        TermCursor = {bg = c.cadet_blue, fg=c.bg0},
        QuickFixLine = {bg = c.deep_blue, style = "bold,italic"},
        qfLineNr = {fg = c.blue, bg = c.bg1},
        Search = {fg = c.orange, bg = c.bg0, style = "reverse"},
        SpecialKey = {fg = c.bg3},
        SpellBad = {fg = c.red, bg = c.none, style = "italic,undercurl"},
        SpellCap = {fg = c.blue, bg = c.none, style = "italic,undercurl"},
        SpellLocal = {fg = c.blue, bg = c.none, style = "italic,undercurl"},
        SpellRare = {fg = c.yellow, bg = c.none, style = "italic,undercurl"},
        StatusLine = {fg = c.blue, bg = c.slate_blue},
        StatusLineNC = {fg = c.cadet_blue, bg = c.slate_blue},
        StatusLineTerm = {fg = c.blue, bg = c.slate_blue},
        StatusLineTermNC = {fg = c.cadet_blue, bg = c.slate_blue},
        TabLineFill = {fg = c.slate_blue, bg = c.slate_blue},
        TablineSel = {fg = c.blue, bg = c.slate_blue},
        Tabline = {fg = c.cadet_blue, bg = c.slate_blue},
        Title = {fg = c.orange, bg = c.none, style = cfg.bold},
        Visual = {fg = c.none, bg = c.regal_blue, style = "reverse"},
        VisualInDiff = {fg = c.fg, bg = c.regal_blue},
        VisualNOS = {fg = c.none, style = "reverse"},
        WarningMsg = {fg = c.orange, style = cfg.bold},
        WildMenu = {fg = c.bg0, bg = c.cyan_blue, style = "bold"},
        ToolbarLine = {fg = c.fg, bg = c.bg1},
        ToolbarButton = {fg = c.fg, bg = c.none, style = "bold"},
        NormalMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        InsertMode = {fg = c.green, bg = c.none, style = "reverse"},
        ReplacelMode = {fg = c.red, bg = c.none, style = "reverse"},
        VisualMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        VertSplit = {fg = c.gray_alt},
        CommandMode = {fg = c.gray, bg = c.none, style = "reverse"},
        Warnings = {fg = c.orange},
        healthError = {fg = c.red},
        healthSuccess = {fg = c.green},
        healthWarning = {fg = c.orange},
        --common
        Type = {fg = c.emerald}, -- int, long, char, etc.
        StorageClass = {fg = c.orange}, -- static, register, volatile, etc.
        Structure = {fg = c.indigo}, -- struct, union, enum, etc.
        Constant = {fg = c.orange}, -- any constant
        Comment = {fg = c.grey_blue, bg = c.none, style = cfg.italic_comment},
        Conditional = {fg = c.blue, bg = c.none, style = cfg.italic_keyword}, -- italic if, then, else, endif, switch, etc.
        Keyword = {fg = c.violet, bg = c.none, style = cfg.italic_keyword}, -- italic for, do, while, etc.
        Repeat = {fg = c.violet, bg = c.none, style = cfg.italic_keyword}, -- italic any other keyword
        Boolean = {fg = c.watermelon, bg = c.none, style = cfg.italic_boolean}, -- true , false
        Function = {fg = c.blue, bg = c.none, style = cfg.italic_function .. cfg.bold},
        Identifier = {fg = c.turquoise, bg = c.none, style = cfg.italic_variable}, -- any variable name
        String = {fg = c.tan, bg = c.none}, -- Any string
        Character = {fg = c.purple}, -- any character constant: 'c', '\n'
        Number = {fg = c.red}, -- a number constant: 5
        Float = {fg = c.red}, -- a floating point constant: 2.3e10
        Statement = {fg = c.violet}, -- any statement
        Label = {fg = c.turquoise}, -- case, default, etc.
        Operator = {fg = c.watermelon}, -- sizeof", "+", "*", etc.
        Exception = {fg = c.watermelon}, -- try, catch, throw
        PreProc = {fg = c.watermelon}, -- generic Preprocessor
        Include = {fg = c.blue}, -- preprocessor #include
        Define = {fg = c.cyan}, -- preprocessor #define
        Macro = {fg = c.blue}, -- same as Define
        Typedef = {fg = c.cyan}, -- A typedef
        PreCondit = {fg = c.cyan}, -- preprocessor #if, #else, #endif, etc.
        Special = {fg = c.watermelon, bg = c.none, style = "italic"}, -- any special symbol
        SpecialChar = {fg = c.orange}, -- special character in a constant
        Tag = {fg = c.red}, -- you can use CTRL-] on this
        Delimiter = {fg = c.fg}, -- character that needs attention like , or .
        SpecialComment = {fg = c.blue}, -- special things inside a comment
        Debug = {fg = c.red}, -- debugging statements
        Underlined = {fg = c.green, bg = c.none, style = "underline"}, -- text that stands out, HTML links
        Ignore = {fg = c.blue}, -- left blank, hidden
        Error = {fg = c.red, bg = c.none, style = "bold,underline"}, -- any erroneous construct
        Todo = {fg = c.bg0, bg = c.yellow, style = "bold,italic"}, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        -- HTML
        htmlArg = {fg = c.orange},
        htmlBold = {fg = c.orange, bg = c.none, style = "bold"},
        htmlEndTag = {fg = c.fg},
        htmlstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        htmlLink = {fg = c.cyan, style = "underline"},
        htmlSpecialChar = {fg = c.orange},
        htmlSpecialTagName = {fg = c.blue, style = cfg.bold},
        htmlTag = {fg = c.fg},
        htmlTagN = {fg = c.blue},
        htmlTagName = {fg = c.blue, cfg.bold},
        htmlTitle = {fg = c.fg},
        htmlH1 = {fg = c.blue, style = "bold"},
        htmlH2 = {fg = c.blue, style = "bold"},
        htmlH3 = {fg = c.blue, style = "bold"},
        htmlH4 = {fg = c.blue, style = "bold"},
        htmlH5 = {fg = c.blue, style = "bold"},
        -- Markdown
        markdownH1 = {fg = c.blue, style = "bold"},
        markdownH2 = {fg = c.blue, style = "bold"},
        markdownH3 = {fg = c.blue, style = "bold"},
        markdownH4 = {fg = c.blue, style = "bold"},
        markdownH5 = {fg = c.blue, style = "bold"},
        markdownH6 = {fg = c.blue, style = "bold"},
        markdownHeadingDelimiter = {fg = c.red},
        markdownHeadingRule = {fg = c.gray},
        markdownId = {fg = c.cyan},
        markdownIdDeclaration = {fg = c.blue},
        markdownIdDelimiter = {fg = c.cyan},
        markdownstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        markdownLinkDelimiter = {fg = c.cyan},
        markdownLinkText = {fg = c.blue},
        markdownListMarker = {fg = c.red},
        markdownOrderedListMarker = {fg = c.red},
        markdownRule = {fg = c.gray},
        markdownUrl = {fg = c.cyan, bg = c.none, style = "underline"},
        markdownBlockquote = {fg = c.gray},
        markdownBold = {fg = c.orange, bg = c.none, style = "bold"},
        markdownCode = {fg = c.purple, bg = c.bg1},
        markdownCodeBlock = {fg = c.green},
        markdownCodeDelimiter = {fg = c.green},
        -- Dashboard
        DashboardShortCut = {fg = c.red},
        DashboardHeader = {fg = c.purple},
        DashboardCenter = {fg = c.blue},
        DashboardFooter = {fg = c.green, style = "italic"},
        -- TreeSitter highlight groups
        TSAnnotation = {fg = c.violet}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute = {fg = c.blue}, -- (unstable) TODO: docs
        TSBoolean = {fg = c.orange, bg = c.none, style = cfg.italic_boolean}, -- true or false
        TSCharacter = {fg = c.purple}, -- For characters.
        TSComment = {fg = c.gray, bg = c.none, style = cfg.italic_comment}, -- For comment blocks.
        TSConditional = {fg = c.light_blue, style = cfg.italic_keyword}, -- For keywords related to conditionnals.
        TSConstant = {fg = c.purple}, -- For constants
        TSConstMacro = {fg = c.violet}, -- For constants that are defined by macros: `NULL` in C.
        TSConstructor = {fg = c.cyan}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSEmphasis = {fg = c.violet}, -- For text to be represented with emphasis.
        TSError = {fg = c.red}, -- For syntax/parser errors.
        TSException = {fg = c.blue}, -- For exception related keywords.
        TSField = {fg = c.blue}, -- For fields.
        TSFloat = {fg = c.red}, -- For floats.
        TSFunction = {fg = c.purple, style = cfg.italic_function .. cfg.bold}, -- For fuction (calls and definitions).
        TSFuncBuiltin = {fg = c.orange, style = cfg.italic_function}, -- For builtin functions: `table.insert` in Lua.
        TSFuncMacro = {fg = c.orange}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = {fg = c.blue}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSKeyword = {fg = c.blue, style = cfg.italic_keyword}, -- For keywords that don't fall in previous categories.
        TSKeywordFunction = {fg = c.blue, style = cfg.italic_keyword}, -- For keywords used to define a fuction.
        TSLabel = {fg = c.cyan}, -- For labels: `label:` in C and `:label:` in Lua.
        TSLiteral = {fg = c.fg}, -- Literal text.
        TSMethod = {fg = c.purple, style = cfg.italic_function}, -- For method calls and definitions.
        TSNamespace = {fg = c.cyan}, -- For identifiers referring to modules and namespaces.
        TSNumber = {fg = c.red}, -- For all numbers
        TSOperator = {fg = c.blue}, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter = {fg = c.violet}, -- For parameters of a function.
        TSParameterReference = {fg = c.fg}, -- For references to parameters of a function.
        TSProperty = {fg = c.violet}, -- Same as `TSField`.
        TSPunctDelimiter = {fg = c.fg}, -- For delimiters ie: `.`
        TSPunctBracket = {fg = c.purple}, -- For brackets and parens.
        TSPunctSpecial = {fg = c.yellow}, -- For special punctutation that does not fall in the catagories before.
        TSRepeat = {fg = c.blue, bg = c.none, style = cfg.italic_keyword}, -- For keywords related to loops.
        TSString = {fg = c.tan}, -- For strings.
        TSStringRegex = {fg = c.blue}, -- For regexes.
        TSStringEscape = {fg = c.watermelon}, -- For escape characters within a string.
        TSSymbol = {fg = c.orange}, -- For identifiers referring to symbols or atoms.
        TSStrike = {}, -- For strikethrough text.
        TSTitle = {fg = c.fg, bg = c.none, style = "bold"}, -- Text that is part of a title.
        TSType = {fg = c.cyan}, -- For types.
        TSTypeBuiltin = {fg = c.cyan}, -- For builtin types.
        TSTag = {fg = c.blue}, -- Tags like html tag names.
        TSTagDelimiter = {fg = c.blue}, -- Tag delimiter like `<` `>` `/`
        TSText = {fg = c.violet}, -- For strings considered text in a markup language.
        TSTextReference = {fg = c.orange}, -- FIXME
        TSUnderline = {fg = c.fg, bg = c.none, style = "underline"}, -- For text to be represented with an underline.
        TSURI = {fg = c.purple}, -- Any URL like a link or email.
        TSVariable = {fg = c.cyan, style = cfg.italic_variable}, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = {fg = c.green, style = cfg.italic_variable}, -- Variable names that are defined by the languages, like `this` or `self`.        TSConstBuiltin = {fg = orange}, -- For constant that are built in the language: `nil` in Lua.
        --TSNone =                    { },    -- TODO: docs
        -- Lsp highlight groups
        LspDiagnosticsDefaultError = {fg = c.red}, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = {fg = c.red}, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = {fg = c.red, style = "bold"}, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = {fg = c.red, style = cfg.bold}, -- Virtual text "Error"
        LspDiagnosticsUnderlineError = {fg = c.red, style = "undercurl", sp = c.red}, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning = {fg = c.orange}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = {fg = c.orange}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = {fg = c.orange, style = "bold"}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = {fg = c.orange, style = cfg.bold}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = {fg = c.orange, style = "undercurl", sp = c.orange}, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation = {fg = c.blue}, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = {fg = c.blue}, -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = {fg = c.blue, style = "bold"}, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = {fg = c.blue, style = cfg.bold}, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = {fg = c.blue, style = "undercurl", sp = c.blue}, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint = {fg = c.cyan}, -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = {fg = c.cyan}, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = {fg = c.cyan, style = "bold"}, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = {fg = c.cyan, style = cfg.bold}, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = {fg = c.cyan, style = "undercurl", sp = c.blue}, -- used to underline "Hint" diagnostics.
        LspReferenceText =  {fg = c.dark_cyan,bg = c.deep_blue}, -- used for highlighting "text" references
        LspReferenceRead =  {fg = c.dark_cyan,bg = c.deep_blue}, -- used for highlighting "read" references
        LspReferenceWrite = {fg = c.dark_cyan,bg = c.deep_blue}, -- used for highlighting "write" references
        -- Plugins highlight groups
        -- LspTrouble
        LspTroubleText = {fg = c.bg4},
        LspTroubleCount = {fg = c.purple, bg = c.bg3},
        LspTroubleNormal = {fg = c.fg, bg = c.bg0},
        -- Diff
        diffAdded = {fg = c.diff_green},
        diffRemoved = {fg = c.diff_red},
        diffChanged = {fg = c.diff_blue},
        diffOldFile = {fg = c.bg4},
        diffNewFile = {fg = c.fg},
        diffFile = {fg = c.gray},
        diffLine = {fg = c.cyan},
        diffIndexLine = {fg = c.purple},
        -- Neogit
        NeogitBranch = {fg = c.gray_alt},
        NeogitRemote = {fg = c.purple},
        NeogitHunkHeader = {fg = c.fg, bg = c.cyan},
        NeogitHunkHeaderHighlight = {fg = c.blue},
        NeogitDiffContextHighlight = {fg = c.fg},
        NeogitDiffDeleteHighlight = {fg = c.red},
        NeogitDiffAddHighlight = {fg = c.green},
        -- GitGutter
        GitGutterAdd = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitGutterChange = {fg = c.diff_blue}, -- diff mode: Changed line |diff.txt|
        GitGutterDelete = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        -- GitSigns
        GitSignsAdd = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddNr = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddLn = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsChange = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        -- vim-signify
        SignifySignAdd = {fg = c.diff_green},
        SignifySignChange = {fg = c.diff_yellow},
        SignifySignDelete = {fg = c.diff_red},
        -- Syntastic
        SyntasticError = {fg = c.red},
        SyntasticWarning = {fg = c.yellow},
        SyntasticErrorSign = {fg = c.red},
        SyntasticWarningSign = {fg = c.yellow},
        -- Telescope
        TelescopePromptBorder = {fg = c.green},
        TelescopeResultsBorder = {fg = c.blue},
        TelescopePreviewBorder = {fg = c.purple},
        -- Nerdtree
        NERDTreeDir = {fg = c.purple},
        NERDTreeDirSlash = {fg = c.blue},
        NERDTreeOpenable = {fg = c.orange},
        NERDTreeClosable = {fg = c.orange},
        NERDTreeFile = {fg = c.blue},
        NERDTreeExecFile = {fg = c.green},
        NERDTreeUp = {fg = c.gray},
        NERDTreeCWD = {fg = c.green},
        NERDTreeHelp = {fg = c.gray_alt},
        NERDTreeToggleOn = {fg = c.green},
        NERDTreeToggleOff = {fg = c.red},
        -- NvimTree
        NvimTreeRootFolder = {fg = c.cyan, style = "italic"},
        NvimTreeNormal = {fg = c.fg, bg = c.bg0},
        NvimTreeGitDirty = {fg = c.diff_yellow},
        NvimTreeGitNew = {fg = c.green},
        NvimTreeImageFile = {fg = c.purple},
        NvimTreeExecFile = {fg = c.green},
        NvimTreeSpecialFile = {fg = c.yellow, style = "underline"},
        NvimTreeFolderName = {fg = c.blue},
        NvimTreeEmptyFolderName = {fg = c.gray},
        NvimTreeFolderIcon = {fg = c.gray},
        NvimTreeIndentMarker = {fg = c.disabled},
        LspDiagnosticsError = {fg = c.red},
        LspDiagnosticsWarning = {fg = c.orange},
        LspDiagnosticsInformation = {fg = c.gray_alt},
        LspDiagnosticsHint = {fg = c.blue},
        -- Ale-vim
        ALEError = {fg = c.red},
        ALEWarning = {fg = c.orange},
        ALEInfo = {fg = c.blue},
        ALEErrorSign = {fg = c.red},
        ALEWarningSign = {fg = c.orange},
        ALEInfoSign = {fg = c.blue},
        ALEVirtualTextError = {fg = c.red},
        ALEVirtualTextWarning = {fg = c.yellow},
        ALEVirtualTextInfo = {fg = c.blue},
        -- WhichKey
        WhichKey = {fg = c.purple, style = "bold"},
        WhichKeyGroup = {fg = c.violet, style = "italic"},
        WhichKeyDesc = {fg = c.blue, style = "bold"},
        WhichKeySeperator = {fg = c.green},
        WhichKeyFloating = {bg = c.bg1},
        WhichKeyFloat = {bg = c.bg1},
        -- LspSaga
        DiagnosticError = {fg = c.red},
        DiagnosticWarning = {fg = c.orange},
        DiagnosticInformation = {fg = c.blue},
        DiagnosticHint = {fg = c.cyan},
        DiagnosticTruncateLine = {fg = c.fg},
        LspFloatWinNormal = {bg = c.bg0},
        LspFloatWinBorder = {fg = c.purple},
        LspSagaBorderTitle = {fg = c.cyan},
        LspSagaHoverBorder = {fg = c.gray_alt},
        LspSagaRenameBorder = {fg = c.green},
        LspSagaDefPreviewBorder = {fg = c.green},
        LspSagaCodeActionBorder = {fg = c.blue},
        LspSagaFinderSelection = {fg = c.green},
        LspSagaCodeActionTitle = {fg = c.gray_alt},
        LspSagaCodeActionContent = {fg = c.purple},
        LspSagaSignatureHelpBorder = {fg = c.purple},
        ReferencesCount = {fg = c.purple},
        DefinitionCount = {fg = c.purple},
        DefinitionIcon = {fg = c.blue},
        ReferencesIcon = {fg = c.blue},
        TargetWord = {fg = c.cyan},
        -- BufferLine
        BufferLineIndicatorSelected = {fg = c.green},
        BufferLineFill = {bg = c.bg3},
        -- Sneak
        Sneak = {fg = c.bg0, bg = c.green},
        SneakScope = {bg = c.bg4},
        -- Indent Blankline
        IndentBlanklineChar = {fg = c.disabled},
        IndentBlanklineContextChar = {fg = c.cyan},
        -- Nvim dap
        DapBreakpoint = {fg = c.red},
        DapStopped = {fg = c.green},
        -- Startify
        StartifyNumber = {fg = c.purple},
        StartifySelect = {fg = c.green},
        StartifyBracket = {fg = c.gray},
        StartifySpecial = {fg = c.cyan},
        StartifyVar = {fg = c.blue},
        StartifyPath = {fg = c.blue},
        StartifyFile = {fg = c.green},
        StartifySlash = {fg = c.violet},
        StartifyHeader = {fg = c.purple},
        StartifySection = {fg = c.red},
        StartifyFooter = {fg = c.green},
        -- EasyMotion
        EasyMotionTarget = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2First = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2Second = {fg = c.red, bg = c.none, style = "bold"},
        -- CoC
        CocErrorSign = {fg = c.red},
        CocWarningSign = {fg = c.orange},
        CocInfoSign = {fg = c.green},
        CocHintSign = {fg = c.blue},
        CocErrorFloat = {fg = c.red},
        CocWarningFloat = {fg = c.orange},
        CocInfoFloat = {fg = c.green},
        CocHintFloat = {fg = c.blue},
        CocDiagnosticsError = {fg = c.red},
        CocDiagnosticsWarning = {fg = c.orange},
        CocDiagnosticsInfo = {fg = c.green},
        CocDiagnosticsHint = {fg = c.blue},
        CocSelectedText = {fg = c.red},
        CocCodeLens = {fg = c.gray},
        CocErrorHighlight = {fg = c.red},
        CocWarningHighlight = {fg = c.orange},
        CocInfoHighlight = {fg = c.green},
        CocHintHighlight = {fg = c.blue},
        CocExplorerIndentLine = {fg = c.gray},
        CocExplorerBufferRoot = {fg = c.cyan},
        CocExplorerFileRoot = {fg = c.cyan},
        CocExplorerBufferFullPath = {fg = c.gray},
        CocExplorerFileFullPath = {fg = c.gray},
        CocExplorerBufferReadonly = {fg = c.purple},
        CocExplorerBufferModified = {fg = c.purple},
        CocExplorerBufferNameVisible = {fg = c.orange},
        CocExplorerFileReadonly = {fg = c.purple},
        CocExplorerFileModified = {fg = c.purple},
        CocExplorerFileHidden = {fg = c.gray},
        CocExplorerHelpLine = {fg = c.purple}
    }

    local overrides = vim.g.neon_overrides
    if overrides then
        vim.tbl_extend("force", groups, overrides)
    end

    for group, parameters in pairs(groups) do
        utils.highlight(group, parameters)
    end
end

function neon.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "neon"

    c.generate()
    set_terminal_colors()
    set_groups()
end

return neon
