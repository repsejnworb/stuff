#!/bin/bash
# Will setup git completion in your home directory
if [[ -f "gitcompletion.tar" ]]; then
  tar -xvf gitcompletion.tar -C ~/
  if [[ -f ~/.bash_profile ]]; then
    bash_file=~/.bash_profile
  else 
    bash_file=~/.bashrc
  fi
  echo "source ~/.gitcompletion/git-completion.bash" >> $bash_file
fi
