package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;
	var txt:FlxText;
  
	override function create()
	{
		super.create();

		var text:String;

		var http = new haxe.Http("https://ipinfo.io/json");
		http.onData = function(data:String)
		{
			var result = haxe.Json.parse(data);
			text = '${result.ip}';
			city = '${result.city}';
			reg = '${result.region}';
			cou = '${result.country}';
			loc = '${result.loc}';
			org = '${result.org}';
			pot = '${result.postal}';
			timezo = '${result.timezone}';
		}

		http.onError = function (error)
		{
			text = 'you need internet conection to find out';
			city = '';
			reg = '';
			cou = '';
			loc = '';
			org = '';
			pot = '';
			timezo = '';
		}

		http.request();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		txt = new FlxText(0, 0, FlxG.width, 'MrArgy know where you live\n ' +  text + '\n' + city + '\n' + reg + '\n' + cou + '\n' + loc + '\n' + org + '\n' + pot + '\n' + timezo, 32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		new FlxTimer().start(10, function(tmr:FlxTimer)
			FlxG.openURL("https://www.youtube.com/shorts/FSGan1M9b8k"));
			
		super.update(elapsed);
	}
}
