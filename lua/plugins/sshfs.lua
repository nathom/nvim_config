return {
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" }, -- optional if you declare plugin somewhere else
	cmd = { "RemoteSSHFSConnect" },
	config = function()
		require("remote-sshfs").setup({})
		require("telescope").load_extension("remote-sshfs")
	end,
}
