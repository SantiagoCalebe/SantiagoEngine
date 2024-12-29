@echo off
color 0D

title SEngine Dependencies

echo ====================================
echo     Welcome to SEngine Dependencies
echo ====================================
echo.

echo Installing lime...
haxelib install lime
echo Installing openfl...
haxelib install openfl
echo Installing flixel...
haxelib install flixel
echo Installing flixel-addons...
haxelib install flixel-addons
echo Installing flixel-ui...
haxelib install flixel-ui
echo Installing flixel-tools...
haxelib install flixel-tools
echo Installing SScript...
haxelib install SScript
echo Installing hxCodec...
haxelib install hxCodec
echo Installing tjson...
haxelib install tjson
echo Installing flxanimate...
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
echo Installing linc_luajit...
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit
echo Installing hxdiscord_rpc...
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc

echo ====================================
echo Dependencies Installed Successfully!
echo ====================================

pause
