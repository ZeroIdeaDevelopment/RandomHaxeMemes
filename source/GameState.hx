package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.system.FlxAssets;
import flixel.input.gamepad.FlxGamepad;

class GameState extends FlxState {
    var music: FlxSound;

    override public function create() {
        super.create();
        music = FlxG.sound.load(FlxAssets.getSound("assets/music/bgm1"));
        music.looped = true;
        music.play();
        var musicText = new FlxText(0, 0, "Press the BACK button to toggle music.", 15);
        musicText.x = 0;
        musicText.y = 480-25;
        add(musicText);
    }

    override public function update(elapsed: Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.BACKSPACE) toggleMusic();
        var gamepad: FlxGamepad = FlxG.gamepads.lastActive;
		if (gamepad != null) updateInput(gamepad);
    }

    private function updateInput(gamepad: FlxGamepad) {
        if (gamepad.justPressed.BACK) toggleMusic();
    }

    private function toggleMusic() {
        if (music.playing) {
            music.pause();
        } else {
            music.resume();
        }
    }
}