package;

import flixel.system.FlxBasePreloader;

class Preloader extends FlxBasePreloader {
    public function new() {
        super(0, ['localhost', 'https://ry00001.me']);
    }
}