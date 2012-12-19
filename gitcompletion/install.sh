#!/bin/bash
# Will setup git completion in your home directory

function error() {
  echo $@
  exit 1
}

if [ -z "$1" ]; then
  echo "Please provide a path to your .bash_profile or .bashrc file"
  error "Usage: $0 ~/.bashrc"
fi

bash_file=$1
if [[ ! -f $bash_file ]]; then
  echo "$bash_file doesn't exists, creating it"
  touch $bash_file
fi

if [[ -f "gitcompletion.tar" ]]; then
  tar -xvf gitcompletion.tar -C ~/
  cmd="source ~/.gitcompletion/git-completion.bash"
  $(grep "$cmd" $bash_file)
  if [[ $? -eq 0 ]]; then
    echo "Not adding anything to $bash_file, the line was already present."
  else
    echo "$cmd" >> $bash_file
    (($?)) && "couldn't append to $bash_file"
  fi 
  $(source $bash_file)
  (($?)) && error "Failed to source the file in the current shell"
  echo "Git completion installed successfully"

fi
