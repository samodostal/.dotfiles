config.load_autoconfig(False)

config.set("tabs.padding", {"top": 8, "bottom": 8, "left": 8, "right": 8})

config.bind("gx", "spawn --userscript qute-bitwarden *")
config.bind("s", "hint")

config.bind("1", "tab-select 1")
config.bind("2", "tab-select 2")
config.bind("3", "tab-select 3")
config.bind("4", "tab-select 4")
config.bind("5", "tab-select 5")
config.bind("6", "tab-select 6")
config.bind("7", "tab-select 7")
config.bind("8", "tab-select 8")
config.bind("9", "tab-select 9")

c.statusbar.show = "in-mode"
c.auto_save.session = True
