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
cd docs/images
ls -R1 > marketItems.strings
sed -e "s/.\//\/\//g" ./marketItems.strings > ./replaced_marketItems.strings
# sed -e 's/.jpg/ = "";/g' ./replaced_marketItems.strings > ./marketItems.strings
