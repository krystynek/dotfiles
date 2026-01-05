autouse() {

  PREV_PWD=$PWD
  if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
  elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
  fi

}

autouse &>/dev/null
chpwd_functions=(${chpwd_functions[@]} "autouse")

