return {
    -- PLUGIN: rose-pine
    {
    	"rose-pine/neovim",
	    name = "rose-pine",
	    lazy = false, -- do not lazy load
	    priority = 1000, -- high priority = loads first
	    config = function()
		    require("rose-pine").setup({
			    variant = "main", -- main colorscheme of rose-pine
		    })
		    vim.cmd("colorscheme rose-pine")
	    end
    },
}
