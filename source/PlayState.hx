package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import haxe.io.Eof;

class PlayState extends FlxState
{
	var text: FlxText;
	var stri: String;
	var x: Int = 0;

	override public function create():Void
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		text = new FlxText(0, 0, "Press [SPACE] to re-play splash.\nPress [W] to return to the warning screen.", 10);
		text.screenCenter();
		text.y = 480-40;
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE) {
			Helper.fadeOut(text, playSplash, 0.3);
		} else if (FlxG.keys.justPressed.W) {
			Helper.fadeOut(text, function(f:FlxTween) {
				FlxG.switchState(new Warning());
			}, 0.3);
		}
	}
	
	public function playSplash(t: FlxTween): Void {
		FlxG.switchState(new ZIDSplash());
	}
}
