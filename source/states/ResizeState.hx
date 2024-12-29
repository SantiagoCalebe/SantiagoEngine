package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxBackdrop;

class ResizeState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	var welcomeTxt:FlxText;
	var checker:FlxBackdrop;

	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
				
		checker = new FlxBackdrop(Paths.image('grid/Grid_lmao'));
		//checker.velocity.set(112, 110);
		checker.updateHitbox();
		checker.scrollFactor.set(0, 0);
		checker.alpha = 0.2;
		checker.screenCenter(X);
		add(checker);

		//welcomeTxt = new FlxText(0, 0, FlxG.width, "Welcome to Santiago's Engine v0.1 [PRE-RELEASE]");
		welcomeTxt = new FlxText(0, 0, FlxG.width, "Welcome to Santiago's Engine " + File.getContent('assets/config/v.txt'));
		welcomeTxt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		welcomeTxt.screenCenter(X);
		//welcomeTxt.x += 400;
		welcomeTxt.y += 100;
		add(welcomeTxt);


		warnText = new FlxText(0, 0, FlxG.width,
			"Select an option:\n
			Press [A] to resize the window to [960x640]
			Press [S] to resize the window to [1280x720]
			Press [D] to resize the window to [1280x1024]
			Press [F] to resize the window to [1366x768]
			Press [G] to resize the window to [1920x1080]\n
			or Press [ENTER] to continue anyway.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);


	}

	override function update(elapsed:Float)
	{
		checker.x += .5*(elapsed/(1/120)); 
		checker.y -= 0.16;

		if (FlxG.keys.justPressed.A) //those dumb resize functions bruhh
		{
			FlxG.resizeWindow(960, 640);
			FlxG.resizeGame(960, 640);
		}

		if (FlxG.keys.justPressed.S)
			{
				FlxG.resizeWindow(1280, 720);
				FlxG.resizeGame(1280, 720);
			}

		if (FlxG.keys.justPressed.D)
		{
			FlxG.resizeWindow(1280, 1024);
			FlxG.resizeGame(1280, 1024);
		}

		if (FlxG.keys.justPressed.F)
		{
			FlxG.resizeWindow(1366, 768);
			FlxG.resizeGame(1366, 768);
		}

		if (FlxG.keys.justPressed.G)
		{
			FlxG.resizeWindow(1920, 1080);
			FlxG.resizeGame(1920, 1080);
		}

		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.data.flashing = false;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('confirmMenu'));
					final height:Float = FlxG.height * Math.max(camera.zoom, 5);
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
