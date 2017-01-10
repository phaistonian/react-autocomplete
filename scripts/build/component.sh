#!/bin/sh -e

export NODE_ENV=production
mkdir -p build/lib dist
babel lib/{index,Autocomplete}.js -d build/
cd dist
browserify ../build/lib/Autocomplete.js --standalone ReactAutocomplete --external react --external react-dom > react-autocomplete.js
cp ../prelude.js react-autocomplete.tmp
sed '1d' react-autocomplete.js >> react-autocomplete.tmp
mv react-autocomplete.tmp react-autocomplete.js
uglifyjs react-autocomplete.js -c --source-map react-autocomplete.min.js.map > react-autocomplete.min.js
