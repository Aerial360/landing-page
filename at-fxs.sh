#!/bin/bash
export JEKYLL_VERSION=3.8

## Building
alias agency_build="docker run --rm --volume=\"$PWD:/srv/jekyll\" -it jekyll/jekyll:$JEKYLL_VERSION jekyll build -d _site --config _config.yml"

## Runnign
alias agency_app_run='docker run --name agency --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -p 5001:4000 -it jekyll/jekyll:$JEKYLL_VERSION jekyll serve --watch --drafts'

alias agency_run='docker exec -it agency jekyll serve --watch --drafts'


## Killing
alias agency_stop="docker container stop /agency && docker container rm /agency"

export MAPBOX_STYLE="drewtu2/ckabx76zg4n6s1ip4qaa3jwcj"
alias new_map2x="wget https://api.mapbox.com/styles/v1/$MAPBOX_STYLE/static/-71.0900,42.3300,12.0,0/1280x1024@2x?access_token=$MAPBOX_KEY -O boston-map.png"
alias new_map="wget https://api.mapbox.com/styles/v1/$MAPBOX_STYLE/static/-71.0900,42.3300,12.0,0/1280x1024?access_token=$MAPBOX_KEY -O boston-map.png"

function webp() {
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"

    cwebp $1 -o $filename.webp
}
