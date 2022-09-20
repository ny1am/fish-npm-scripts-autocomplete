# fish-npm-scripts-autocomplete

## Getting Started

### Prerequisites

- [jq](https://github.com/stedolan/jq/wiki/Installation)
- [fzf](https://github.com/junegunn/fzf)

### Installation

1. Add script to fish functions

```shell
curl https://raw.githubusercontent.com/ny1am/fish-npm-scripts-autocomplete/main/npm_scripts_autocomplete.fish -o $HOME/.config/fish/functions/npm_scripts_autocomplete.fish
```

2. Add hotkey binding $HOME/.config/fish/functions/fish_user_key_bindings.fish

```
function fish_user_key_bindings
  ...

  # add this line to bind a hotkey
  bind \cn npm_scripts_autocomplete # Ctrl+N
end
```
