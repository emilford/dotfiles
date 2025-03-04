return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      dark_variant = "moon",
      highlight_groups = {
        ["@string.special.symbol.ruby"] = { fg = "foam" },
        ["Pmenu"] = { link = "FloatBorder" },
        ["BlinkCmpGitKindCommit"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIssue"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindMention"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindMR"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindPR"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIconCommit"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIconIssue"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIconMention"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIconMR"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitKindIconPR"] = { link = "BlinkCmpKind" },
        ["BlinkCmpGitLabelCommitId"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelCommitRest"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelIssueId"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelIssueRest"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelMentionId"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelMentionRest"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelMRId"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelMRRest"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelPRId"] = { link = "BlinkCmpLabel" },
        ["BlinkCmpGitLabelPRRest"] = { link = "BlinkCmpLabel" },
      },
      palette = {
        dawn = {
          text = "#575279",
        },
      },
      styles = {
        transparency = true,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)

      vim.cmd([[colorscheme rose-pine]])
    end,
  },
}
