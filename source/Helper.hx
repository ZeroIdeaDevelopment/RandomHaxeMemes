package;

import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.FlxG;

class Helper {
    public static function fadeIn(t: FlxSprite, ?onComplete: FlxTween->Void, ?timeout=0.5, ?color: FlxColor): FlxTween {
        var tweenFrom = FlxColor.fromRGB(0, 0, 0, 255);
        var tweenTo = color != null ? color : FlxColor.fromRGB(255, 255, 255, 255);
        var options = {ease: FlxEase.sineIn, onComplete: onComplete};
        return FlxTween.color(t, timeout, tweenFrom, tweenTo, options);
    }

    public static function fadeOut(t: FlxSprite, ?onComplete: FlxTween->Void, ?timeout=0.5, ?color: FlxColor): FlxTween {
        var tweenFrom = color != null ? color : FlxColor.fromRGB(255, 255, 255, 255);
        var tweenTo = FlxColor.fromRGB(0, 0, 0, 255);
        var options = {ease: FlxEase.sineIn, onComplete: onComplete};
        return FlxTween.color(t, timeout, tweenFrom, tweenTo, options);
    }
}