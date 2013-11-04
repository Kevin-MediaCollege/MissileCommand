package com.snakybo.misslecommand.sound {
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.utils.Dictionary;
	
	public class SoundManager {
		private static var sounds:Dictionary;
		
		private static var initialized:Boolean;
		
		public static function initialize():void {
			if(initialized) {
				return;
			}
			
			initialized = true;
			
			sounds = new Dictionary(true);
		}
		
		public static function importSound(label:String, fileName:String):void {
			var s:Sound = new Sound();
			
			s.addEventListener(Event.COMPLETE, onComplete);
			
			s.load(new URLRequest("sound/" + fileName));
			
			function onComplete(e:Event):void {
				sounds[label] = s;
			}
		}
		
		public static function playSound(label:String):void {
			if (sounds[label] != undefined) {
				sounds[label].play();
			}
		}
		
		public static function dispose():void {
			initialized = false;
			sounds = null;
		}
	}
}