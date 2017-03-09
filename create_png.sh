#!/bin/sh
set -e

init_folder() {
    mkdir -p $1
}

init_folder ../app/src/main/res/drawable-mdpi
init_folder ../app/src/main/res/drawable-hdpi
init_folder ../app/src/main/res/drawable-xhdpi
init_folder ../app/src/main/res/drawable-xxhdpi
init_folder ../app/src/main/res/drawable-xxxhdpi

init_folder temp
cp -a png/. temp
cd temp

for file in $(find . -type f -iname '*@4x*'); do
  rm "../../app/src/main/res/drawable-xxxhdpi/${file/@4x/}" ||:
  mv "$file" "../../app/src/main/res/drawable-xxxhdpi/${file/@4x/}"
done

for file in $(find . -type f -iname '*@3x*'); do
  rm "../../app/src/main/res/drawable-xxhdpi/${file/@3x/}" ||:
  mv "$file" "../../app/src/main/res/drawable-xxhdpi/${file/@3x/}"
done

for file in $(find . -type f -iname '*@2x*'); do
  rm "../../app/src/main/res/drawable-xhdpi/${file/@2x/}" ||:
  mv "$file" "../../app/src/main/res/drawable-xhdpi/${file/@2x/}"
done

for file in $(find . -type f -iname '*@1,5x*'); do
  rm "../../app/src/main/res/drawable-hdpi/${file/@1,5x/}" ||:
  mv "$file" "../../app/src/main/res/drawable-hdpi/${file/@1,5x/}"
done

for file in $(find . -type f -iname '*@1x*'); do
  rm "../../app/src/main/res/drawable-mdpi/${file/@1x/}" ||:
  mv "$file" "../../app/src/main/res/drawable-mdpi/${file/@1x/}"
done

rm -r ../temp

