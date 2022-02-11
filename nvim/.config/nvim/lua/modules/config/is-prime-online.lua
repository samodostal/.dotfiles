return function()
	require("is-prime-online").setup({
		source = "twitch",
		streamer_name = "thePrimeagen",
		refresh_interval_in_seconds = 60,
		callback_on_start = function()
		end,
	})
end
