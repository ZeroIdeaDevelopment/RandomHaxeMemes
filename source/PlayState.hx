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
		text = new FlxText(0, 0, "Press [SPACE] to re-play splash.", 10);
		text.screenCenter();
		text.y = 480-20;
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE) {
			var tweenFrom = FlxColor.fromRGB(255, 255, 255, 255);
			var tweenTo = FlxColor.fromRGB(0, 0, 0, 255);
			FlxTween.color(text, 0.3, tweenFrom, tweenTo, {onComplete: playSplash});
		}
	}
	
	public function playSplash(t: FlxTween): Void {
		FlxG.switchState(new ZIDSplash());
	}
}
