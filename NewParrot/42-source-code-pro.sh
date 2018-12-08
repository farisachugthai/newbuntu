#!/usr/bin/env sh
# Maintainer: Faris Chugthai

# set -euo pipefail
fonts_dir="${HOME}/.local/share/fonts"

 if [[ ! -d "${fonts_dir}" ]]; then
    echo "mkdir -p $fonts_dir"

    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

for font in SourceCodeVariable-italic SourceCodeVariable-Roman;
do
    file_path="${HOME}/.local/share/fonts/${font}.ttf"
    curl -o "$file_path https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/${font}.ttf"
done

exit 0
