#!/bin/sh
VERSION="v1"
declare -a gabages=(
    default_market_items.json
    d2json.js
)

function remove_unnecessaries () {
    for ((i = 0; i < ${#gabages[@]}; i++)) {
        NAME_STR=${gabages[i]%.*}
        sed -e "s/{\"name\":\"${NAME_STR}\",\"section\":\".\",\"imageUrl\":\"https\:\/\/watarusuzuki.github.io\/MealDock\/${VERSION}\/images\/.\/${gabages[i]}\",\"count\":0,\"timeStamp\":0},//g" ./default_market_items.json > ./data-new.json

        rm default_market_items.json
        mv data-new.json default_market_items.json
    }
}

cd `dirname $0`

TARGET_DIR="docs/${VERSION}/"
DEFAULT_IMG_DIR="${TARGET_DIR}images/"
cp d2StringTable.js ${DEFAULT_IMG_DIR}d2StringTable.js
cd ${DEFAULT_IMG_DIR}
find . -name ".DS_Store" | xargs rm
node d2StringTable > MarketItems.strings
cd -
sed -e 's/";//g' -e s/' = "'/$'\t'/g ./${DEFAULT_IMG_DIR}MarketItems.strings > ./workspaces/localizable-base.txt
mv ${DEFAULT_IMG_DIR}MarketItems.strings workspaces/MarketItems.strings
rm ${DEFAULT_IMG_DIR}d2StringTable.js

cp d2json.js ${DEFAULT_IMG_DIR}d2json.js
cd ${DEFAULT_IMG_DIR}
find . -name ".DS_Store" | xargs rm
node d2json > default_market_items.json
cd -
mv ${DEFAULT_IMG_DIR}default_market_items.json default_market_items.json
rm ${DEFAULT_IMG_DIR}d2json.js

remove_unnecessaries

mv default_market_items.json ${TARGET_DIR}default_market_items.json
