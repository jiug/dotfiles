local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

-- 📌 LuaSnip Snippet Template
-- ---------------------------
-- Use this structure to define new LaTeX snippets quickly:
--
-- s(
--   "trigger",               -- 🧲 The text you type to trigger the snippet
--   fmt(
--     [[
--     \command{{{}}}
--     ]],
--     {
--       i(1, "placeholder"), -- 🔢 Insert node index and default text
--     }
--   )
-- ),
--
-- ✅ Notes:
-- - Use `i(n, "default")` to create insertable fields.
-- - Use `{}` inside the fmt string to mark where fields go.
-- - Always wrap the snippet in `s(...)`.
-- - Make sure to place snippets **inside** ls.add_snippets("tex", { ... }).
--
-- ▶️ Example:
-- s("bf", fmt("\\textbf{{{}}}", { i(1, "bold text") })),

local function in_mathzone()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- 🔥 Math-mode autosnippets
ls.add_snippets('tex', {
	s({ trig = 'ff', snippetType = 'autosnippet', condition = in_mathzone },
		fmt('\\frac{{{}}}{{{}}}', { i(1, 'num'), i(2, 'den') })),

	s({ trig = 'sq', snippetType = 'autosnippet', condition = in_mathzone }, fmt('\\sqrt{{{}}}', { i(1, 'arg') })),
})

ls.add_snippets('tex', {
	--Operador derivada segunda
	s(
		'd2',
		fmt(
			[[
\frac{{d^2{}}}{{d{}^2}}
]],
			{
				i(1, 'f(x)'),
				i(2, 'x'),
			}
		)
	),
	--Insertar \input{} para una figura Tikz
	s(
		'tikz',
		fmt(
			[[
\begin{{figure}}
	\begin{{center}}
					\input{{figs/{}}}	
	\end{{center}}
	\caption{{{}}}\label{{fig:{}}}
\end{{figure}}
												]],
			{
				i(1, 'path/to/tikz'),
				i(2, 'caption'),
				i(3, 'label'),
			}
		)
	),
	-- Insertar integrales con límites
	s(
		'intldx',
		fmt(
			[[
					\int_{{{}}}^{{{}}}{}d{}
			]],
			{
				i(1, 'from'),
				i(2, 'to'),
				i(3, 'f(x)'),
				i(4, 'x'),
			}
		)
	),
	s(
		'sum',
		fmt(
			[[
					\sum_{{{}}}^{{{}}}{}
			]],
			{
				i(1, 'from'),
				i(2, 'to'),
				i(3, 'f_i'),
			}
		)
	),
})

ls.add_snippets('tex', {
	--Operador derivada
	s(
		'dd',
		fmt(
			[[
\frac{{d{}}}{{d{}}}
]],
			{
				i(1, 'f(x)'),
				i(2, 'x'),
			}
		)
	),
	s(
		'dpart',
		fmt(
			[[
\frac{{\partial^{{{}}} {}}}{{\partial {}^{{{}}}}}
]],
			{
				i(1, 'power'),
				i(2, 'f(x)'),
				i(3, 'x'),
				i(4, 'power'),
			}
		)
	),
	-- -- Insertar símbolos
	s('inft', fmt('\\infty', {})),
	s('->', fmt('\\rightarrow', {})),
	s('<-', fmt('\\leftarrow', {})),
	s('eqref', fmt('\\eqref{{eq:{}}}', { i(1, 'label') })),
	-- Insertar \begin{} \end{}
	--:
	s(
		'\beg',
		fmt(
			[[
\begin{{{}}}
{}
\end{{{}}}
	]],
			{
				i(1, 'environment'),
				i(2, 'content'),
				i(1, 'environment'),
			}
		)
	),
	-- Insertar imagen con prioridad variable
	s(
		'fhh',
		fmt(
			[[
\begin{{figure}}[{}]
  \begin{{center}}
    \includegraphics[width={}\textwidth]{{figs/{}}}
  \end{{center}}
  \caption{{{}}}\label{{fig:{}}}
\end{{figure}}
]],
			{
				i(1, 'priority'),
				i(2, 'width'),
				i(3, 'fig_name'),
				i(4, 'caption'),
				i(5, 'label'),
			}
		)
	),
	s(
		'sfhh',
		fmt(
			[[
\begin{{figure}}[{}]
  \centering
  \begin{{subfigure}}{{{}\textwidth}}
    \centering
    \includegraphics[width=0.7\linewidth]{{figs/{}}}
    \subcaption{{{}}}
    \label{{fig:{}}}
  \end{{subfigure}}
  \quad
  \begin{{subfigure}}{{{}\textwidth}}
    \centering
    \includegraphics[width=0.7\linewidth]{{figs/{}}}
    \subcaption{{{}}}
    \label{{fig:{}}}
  \end{{subfigure}}
  \caption{{{}}}
  \label{{fig:{}}}
\end{{figure}}
]],
			{
				i(1, 'figure placement'),
				i(2, 'widthA'),
				i(3, 'first-figure'),
				i(4, 'Subcaption A'),
				i(5, 'labelA'),
				i(6, 'second-figure'),
				i(7, 'widthB'),
				i(8, 'Subcaption B'),
				i(9, 'labelB'),
				i(10, 'Main caption'),
				i(11, 'main-label'),
			}
		)
	),
}, {
	type = 'autosnippets',
})
