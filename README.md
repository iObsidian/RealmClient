This is a 'fork' of slick1015's rotmg-client

# rotmg-client
Realm of the Mad God AS3 client based on the latest version.

The original client was decompiled in Action Script Viewer and I am continuing to update it manually by looking at the differences in each client update. You can see the changes for yourself in my client-diff repo.

Help with bugs is always helpful. If you found one, make an issue. If you have a fix for one make a pull request.

# Features

- Clean original source (still being cleaned)
- Google Analytics removed
- Correct 3rd party libraries (versions might be a little off)
- 99% bug free (only bugs left are from Kabam :v)



# Requirements

- IntelliJ IDEA Ultimate or similar Flash IDE
- Flex SDK 4.6.0.23201 (http://download.macromedia.com/pub/flex/sdk/builds/flex4.6/flex_sdk_4.6.0.23201.zip)
- Flash Projector Content Debugger (https://fpdownload.macromedia.com/pub/flashplayer/updaters/24/flashplayer_24_sa_debug.exe)

# Tools required to update
- JPEXS to decompile scripts
- WinMerge to compare scripts
- Trillix to export assets (export to fla)



# Notes

- Updating images requires to export the newest client via trillix. Copy the asset folder in the exported source to the current rotmg client source.

# Credits

- kaos00723 (Kaos) - did some hella dirty work
- cp-nilly	(nilly) - lord and savior
- Slick - leaches off others work
- 059 - hooks me up with ~~needles~~ assets for every update
- Alde - updated to 27.7.X11, or so he thinks