# restore-tabs.yazi

> [!Important]
> I made this simple plugin before knowing there is a more complete
> plugin that already does this better so you might just use that one
> instead: [Repo Link](https://github.com/MasouShizuka/projects.yazi)

## Description
[yazi](https://github.com/sxyazi/yazi) plugin that allows to store tabs before exit and restore them with a keybind

## Install
```sh
ya pkg add Direwolfesp/restore-tabs
```

## Configuration

Add this to you `keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = [ "q" ]
run = "plugin restore-tabs store_session"
desc = "Exits yazi and stores the tabs"
```

Add this to you `init.lua:`
```lua
require("restore-tabs"):entry({ args = { "restore_session" } })
```
