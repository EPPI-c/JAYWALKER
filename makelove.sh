#!/usr/bin/env bash

if [ $# -ne 0 ]; then
	>&2 echo "Invalid number of arguments"
fi

# make love file
zip -9 -r JAYWALKER.love \
conf.lua \
configuration.lua \
death.lua \
game.lua \
helper.lua \
images/ \
main.lua \
menu.lua \
pause.lua \
person.lua \
push.lua \
ui.lua \
streets.lua \
state.lua \
sound-fx/

mv JAYWALKER.love output/

# make html game
pnpx love.js --title "JAYWALKER" output/JAYWALKER.love output/html

zip -r JAYWALKER-HTML.zip output/html/*
mv JAYWALKER-HTML.zip output/

# make exe
cat love.exe output/JAYWALKER.love > love-11.5-win64/JAYWALKER.exe
zip -r JAYWALKER.zip love-11.5-win64/
mv JAYWALKER.zip output/
