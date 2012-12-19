#!/bin/bash
# Will setup git completion in your home directory

function error() {
  echo $@
  exit 1
}

if [[ -f "gitcompletion.tar" ]]; then
  tar -xvf gitcompletion.tar -C ~/
  if [[ -f ~/.bash_profile ]]; then
    bash_file=~/.bash_profile
  else 
    bash_file=~/.bashrc
  fi
  cmd="source ~/.gitcompletion/git-completion.bash"
  if [ -n "grep ""$cmd"" "$bash_file"" ]; then
    echo "Not adding anything to $bash_file, the line was already present."
    (($?)) || echo "Git completion installed successfully"
  else
    echo "$cmd" >> $bash_file
    (($?)) || echo "Git completion installed successfully"
  fi 

fi
