return {
  'sunbluesome/ipynvim',
  dependencies = { 'sunbluesome/luapng', 'sunbluesome/mathpng' },
  event = { 'BufReadCmd *.ipynb' },
  opts = {},
  config = function(_, opts)
    require('ipynvim').setup {
      -- Maximum width (columns) for output text.
      max_output_width = 80,

      -- Maximum height (rows) for output.
      max_output_height = 30,

      -- Font size for LaTeX rendering.
      latex_font_size = 12,

      -- DPI for LaTeX rendering.
      latex_dpi = 150,

      -- Python venv path (relative to plugin root or absolute). nil = system python3.
      python_venv = '~/Learning/Máster/env/bin/python3',
      -- Set PYTHONPATH to prioritize virtual environment packages
      python_env = {
        PYTHONPATH = '~/Learning/Máster/env/lib/python3.12/site-packages:~/.local/lib/python3.12/site-packages',
      },

      -- Image display mode: "inline" (Kitty Graphics Protocol) or "placeholder" (text only).
      image_display = 'inline',
    }
  end,
}
