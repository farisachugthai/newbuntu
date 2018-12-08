#!/usr/bin/env sh
# https://raw.githubusercontent.com/termux/termux-styling/master/setup-nerd-fonts.sh
# yes a termux script for ubuntu

set -euo pipefail

getNerdFont() {

	project='ryanoasis/nerd-fonts'

	# tag=1.2.0
	# https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.0.0
	tag=2.0.0

	#url="https://raw.githubusercontent.com/${project}/${tag}/patched-fonts/${1// /%20}"
	url="https://raw.githubusercontent.com/${project}/${tag}/patched-fonts/${2}"

	# local_file=app/src/main/assets/fonts/$1.ttf
	local_file="$HOME/.local/share/fonts/$1.ttf"

	curl -fLo "${local_file}" "${url}"
}

getNerdFont Anonymous-Pro "AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont DejaVu "DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Fantasque "FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont FiraCode "FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf"

getNerdFont Fira "FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf"

getNerdFont Go "Go-Mono/complete/Go%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Hack "Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Hermit "Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete%20Mono.otf"

getNerdFont Inconsolata "Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete%20Mono.otf"

getNerdFont Iosevka "Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont LiberationMono "LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Meslo "Meslo/L/complete/Meslo%20LG%20L%20Regular%20Nerd%20Font%20Complete%20Mono.otf"

getNerdFont Monofur "Monofur/Regular/complete/monofur%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Monoid "Monoid/complete/Monoid%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Roboto "RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Source-Code-Pro "SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf"

getNerdFont Ubuntu "UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"
