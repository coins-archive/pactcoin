
Debian
====================
This directory contains files used to package pactd/pact-qt
for Debian-based Linux systems. If you compile pactd/pact-qt yourself, there are some useful files here.

## pact: URI support ##


pact-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install pact-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your pactqt binary to `/usr/bin`
and the `../../share/pixmaps/pact128.png` to `/usr/share/pixmaps`

pact-qt.protocol (KDE)

