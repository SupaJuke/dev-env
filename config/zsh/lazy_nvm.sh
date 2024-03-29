# nvm
lazynvm() {
  	unset -f nvm node npm npx yarn nvim git
  	export NVM_DIR=~/.nvm
  	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
    lazynvm 
    nvm $@
}

node() {
    lazynvm
    node $@
}

npm() {
    lazynvm
    npm $@
}

npx() {
    lazynvm
    npx $@
}

yarn() {
    lazynvm
    yarn $@
}

nvim() {
    lazynvm
    nvim $@
}

git() {
    lazynvm
    git $@
}

