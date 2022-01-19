return function()
	require("lightspeed").setup({
		exit_after_idle_msecs = { labeled = 1500, unlabeled = 1000 },

		-- s/x
		jump_to_unique_chars = true,
		match_only_the_start_of_same_char_seqs = true,
		substitute_chars = { ["\r"] = "¬" },

		-- f/t
		limit_ft_matches = 4,
		instant_repeat_fwd_key = nil,
		instant_repeat_bwd_key = nil,
	})
end
