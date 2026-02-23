vim.api.nvim_create_autocmd('FileType', {
	pattern = 'tex',
	callback = function()
		vim.cmd [[ highlight texSectionTitle guifg=#fabd2f gui=bold ]]
		vim.cmd [[ highlight texCmd guifg=#fe8019 gui=bold ]]
		vim.cmd [[ highlight texMathZoneX guifg=#83a598 ]]
		vim.cmd [[ highlight texRefZone guifg=#d3869b gui=underline ]]
		vim.cmd [[ highlight texBeginEndName guifg=#b8bb26 gui=italic ]]
	end,
})
