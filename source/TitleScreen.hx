package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.input.gamepad.FlxGamepad;

class TitleScreen extends FlxState
{
	var texts: Array<Dynamic>;
	override public function create():Void
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		texts = [];
		texts.push({
			text: new FlxText(0, 0, "Random\nHaxe\nMemes", 60),
			create: function(t: FlxText) {
				t.screenCenter();
				t.y = 40;
			}
		});
		texts.push({
			text: new FlxText(0, 0, "Press START or ENTER", 20),
			create: function(t: FlxText) {
				t.screenCenter();
				t.y += 80;
			}
		});
		texts.push({
			text: new FlxText(0, 0, "(C) ZeroIdea Development, 2018.", 10), 
			create: function(t: FlxText) {
				t.screenCenter();
				t.y = 480-30;
			}
		});

		for (i in texts) {
			var text = i.text;
			if (i.create != null) i.create(text);
			Helper.fadeIn(text);
			add(text);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.S) {
			for (text in texts) Helper.fadeOut(text, function(t: FlxTween) {
				FlxG.switchState(new ZIDSplash()); 
			}, 0.3);
		} else if (FlxG.keys.justPressed.W) {
			for (text in texts) {
				Helper.fadeOut(text, function(f:FlxTween) {
					FlxG.switchState(new Warning());
				}, 0.3);
			}
		}

		var gamepad: FlxGamepad = FlxG.gamepads.lastActive;
		if (gamepad != null) updateInput(gamepad);
		if (FlxG.keys.justPressed.ENTER) startGame();
	}

	private function updateInput(gamepad: FlxGamepad) {
		if (gamepad.pressed.A || gamepad.pressed.START) startGame();
	}

	private function startGame() {
		for (text in texts) {
			Helper.fadeOut(text.text, function(t:FlxTween) {
				add(
					new FlxText(10, 480-40, "Loading...", 16)
				);
				FlxG.switchState(new GameState());
			});
		}
	}
}
