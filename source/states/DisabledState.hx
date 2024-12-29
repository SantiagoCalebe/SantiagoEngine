package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxBackdrop;

class DisabledState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
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
		checker.alpha = 0.1;
		checker.screenCenter(X);
		add(checker);

		warnText = new FlxText(0, 0, FlxG.width,
			"Character Editor is disabled until bugfix. \n\n
			Thank you for using Santiago Engine.
			Press ESC or Enter to return.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);


	}

	override function update(elapsed:Float)
	{
		checker.x += .5*(elapsed/(1/120)); 
		checker.y -= 0.16;

		if (FlxG.keys.justPressed.ESCAPE) 
			{
				MusicBeatState.switchState(new MainMenuState());
			}

		if (FlxG.keys.justPressed.ENTER)
			{
				MusicBeatState.switchState(new MainMenuState());
			}

			super.update(elapsed);
	}
}