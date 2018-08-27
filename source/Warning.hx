package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.system.FlxAssets;

class Warning extends FlxState {
    var stuff: Array<Dynamic>;
    var keyAppeared: Bool;
    var key: FlxText;

    override public function create() {
        super.create();
        FlxG.mouse.useSystemCursor = true;
        key = new FlxText(0, 0, "Press any key to continue.", 12);
        key.screenCenter();
        key.y = 350;
        stuff = [];
        stuff.push(
            {ting: new FlxText(0, 0, "WARNING!", 50), create: function(t: FlxText) {
                t.screenCenter();
                t.y = 75;
            }, aftertween: null, color: FlxColor.fromRGB(255, 0, 0, 255)}
        );
        stuff.push(
            {ting: new FlxText(0, 0, "This is made by ry00001.\nExpect stupidity.", 15), create: function(t: FlxText) {
                t.screenCenter();
                var timer = new FlxTimer();
                timer.time = 1;
                timer.start();
                timer.onComplete = function(t: FlxTimer) {
                    Helper.fadeIn(key, function(t: FlxTween) {
                        keyAppeared = true;
                    });
                    add(key);
                }
            }, aftertween: null, color: null}
        );

        for (i in stuff) {
            var heck = i.ting;
            if (i.create != null) i.create(heck);
            Helper.fadeIn(heck, (i.aftertween != null ? i.aftertween : null), 0.5, (i.color != null ? i.color : null));
            add(heck);
        }
    }

    override public function update(elapsed: Float) {
        super.update(elapsed);
        if (FlxG.keys.justPressed.ANY && keyAppeared) fadeStuff();
    }

    private function fadeStuff() {
        Helper.fadeOut(key);
        for (i in stuff) {
            Helper.fadeOut(i.ting, function(t: FlxTween) {
                FlxG.switchState(new ZIDSplash());
            }, 0.5, (i.color != null ? i.color : null));
        }
    }
}