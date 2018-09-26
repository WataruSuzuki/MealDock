#!/bin/sh

declare -a gabages=(
    default_market_items.json
    d2json.js
)

function remove_unnecessaries () {
    for ((i = 0; i < ${#gabages[@]}; i++)) {
        NAME_STR=${gabages[i]%.*}
        sed -e "s/{\"name\":\"${NAME_STR}\",\"section\":\".\",\"imageUrl\":\"https\:\/\/watarusuzuki.github.io\/MealDock\/images\/.\/${gabages[i]}\",\"timeStamp\":0},//g" ./default_market_items.json > ./data-new.json

        rm default_market_items.json
        mv data-new.json default_market_items.json
    }
}

cd `dirname $0`

DEFAULT_IMG_DIR="docs/images/"
cp d2StringTable.js ${DEFAULT_IMG_DIR}d2StringTable.js
cd ${DEFAULT_IMG_DIR}
find . -name ".DS_Store" | xargs rm
node d2StringTable > marketItems.strings
cd -
mv ${DEFAULT_IMG_DIR}marketItems.strings workspaces/marketItems.strings
rm ${DEFAULT_IMG_DIR}d2StringTable.js

cp d2json.js ${DEFAULT_IMG_DIR}d2json.js
cd ${DEFAULT_IMG_DIR}
find . -name ".DS_Store" | xargs rm
node d2json > default_market_items.json
cd -
mv ${DEFAULT_IMG_DIR}default_market_items.json default_market_items.json
rm ${DEFAULT_IMG_DIR}d2json.js

remove_unnecessaries

mv default_market_items.json docs/default_market_items.json
