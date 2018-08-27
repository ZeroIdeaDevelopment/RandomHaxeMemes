package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.system.FlxAssets;

class ZIDSplash extends FlxState {
    var to: FlxText;
    var hfl: FlxSprite;

    override public function create(): Void {
        super.create();
        FlxG.mouse.useSystemCursor = true;
        to = new FlxText(1, 1, "ZeroIdea Development", 25);
        to.screenCenter();
        to.y = 310;
        Helper.fadeIn(to);
        add(to);
        hfl = new FlxSprite(0, 0);
        hfl.loadGraphic("assets/images/zid.png");
        hfl.y -= 20;
        hfl.screenCenter();
        Helper.fadeIn(hfl, playJingle);
        add(hfl);
    }

    public function playJingle(tween: FlxTween):Void {
        var sound = FlxG.sound.load(FlxAssets.getSound("assets/sounds/zid"));
        sound.play();
        sound.onComplete = function() {
            Helper.fadeOut(to, switchScene);
            Helper.fadeOut(hfl);
        };
    }

    public function switchScene(tween: FlxTween): Void {
        FlxG.switchState(new HFSplash());
    }
}