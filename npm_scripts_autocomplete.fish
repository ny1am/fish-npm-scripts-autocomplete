function _check_node_package_manager;
  if test -e ./yarn.lock
    echo "yarn"
  else if test -e ./package.json
    echo "npm"
  else
    echo "Error: package.json file doesn't exist" 1>&2
    return 1
  end;
end


function npm_scripts_autocomplete;
  set -l package_manager $(_check_node_package_manager)
  
  if [ $package_manager ]
    set -l cmd_prefix $(if test $package_manager = "npm"; echo "npm run"; else; echo $package_manager; end)
    set -l user_scripts_keys $(jq -r '.scripts | keys_unsorted[]' package.json)
    begin 
      printf $cmd_prefix' %s\n' $user_scripts_keys
      echo "$package_manager install"
    end | fzf --prompt "> " --preview 'jq -r .scripts package.json' --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1 | read script
  end
  
  if [ $script ]
    commandline -r $script
    commandline -f repaint
    commandline -f execute
  else
    commandline -r ''
    commandline -f repaint
  end
end
