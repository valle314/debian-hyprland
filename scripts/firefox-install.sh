#!/bin/bash

mv ${1} ~/.local/share/${1} 

sudo rm ~/.local/share/applications/firefox-stable.desktop
touch ~/.local/share/applications/firefox-stable.desktop
cat <<EOT >> ~/.local/share/applications/firefox-stable.desktop
[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=${HOME}/.local/share/firefox/firefox %u
Terminal=false
Type=Application
Icon=${HOME}/.local/share/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=${HOME}/.local/share/firefox/firefox --private-window %u
Name=Open in private mode
EOT

