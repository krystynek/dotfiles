return {
	"nvim-mini/mini.sessions",
	config = function()
		require("mini.sessions").setup({
			autoread = false,
			autosave = true,
			-- You can add more options here if needed
		})
	end,
}
