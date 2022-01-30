#!/bin/bash

# requires brew

brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

#TODO: Themes

THEMES_DIR=$(brew --prefix oh-my-posh)/themes
CHOSEN_THEME="marcduiker"

cp $THEMES_DIR/$CHOSEN_THEME.omp.json ~/$CHOSEN_THEME.omp.json

echo "eval \"$(oh-my-posh --init --shell bash --config ~/$CHOSEN_THEME.omp.json)\"" >> ~/.bashrc