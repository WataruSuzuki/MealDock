#!/bin/sh
cd `dirname $0`

cp localized-strings-MealDock\ -\ ja.csv ja.strings
sed -e 's/$/";/g' -e 's/"key=";//g' -e '/^$/d' -e 's/",//g' -e 's/,/ = "/g' ./ja.strings > ./ja/Localizable.strings
rm ja.strings
