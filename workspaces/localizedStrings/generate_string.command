#!/bin/sh
cd `dirname $0`

declare -a english=(
    "localized-strings-MealDock - en.csv"
    "localized-strings-MealDock-food - en.csv"
    "localized-strings-in-app-purchase - en.csv"
)

declare -a japanese=(
    "localized-strings-MealDock - ja.csv"
    "localized-strings-MealDock-food - ja.csv"
    "localized-strings-in-app-purchase - ja.csv"
)

declare -a generated=(
    'Localizable.strings'
    'MarketItems.strings'
    'InAppPurchase.strings'
)

function generate_strings() {
    for ((i = 0; i < ${#english[@]}; i++)) {
        cat "${english[i]}" | dos2unix > en.strings
        sed -e 's/$/";/g' -e 's/"key=";//g' -e 's/,"/,/g' -e '/^$/d' -e 's/",//g' -e 's/,/ = "/g' -e 's/ = " /,/g' -e 's/""/"/g' ./en.strings > ./base/"${generated[i]}"
        rm en.strings

        cat "${japanese[i]}" | dos2unix > ja.strings
        sed -e 's/$/";/g' -e 's/"key=";//g' -e '/^$/d' -e 's/",//g' -e 's/,/ = "/g' -e 's/ = " = "";//g' ./ja.strings > ./ja/"${generated[i]}"
        rm ja.strings
    }
}

cd `dirname $0`

generate_strings
