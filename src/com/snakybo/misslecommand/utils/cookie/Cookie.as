package com.snakybo.misslecommand.utils.cookie {
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	
	/** @author Kevin Krol */
	public class Cookie {
		private static var cookies:Dictionary;
		
		private static var initialized:Boolean;
		
		public static function initialize():void {
			if (!initialized) {
				initialized = true;
				
				cookies = new Dictionary(true);
			}
		}
		
		public static function setCookie(soName:String, label:String, value:String):void {
			var so:SharedObject = SharedObject.getLocal(soName);
			
			so.data[label] = value;
		}
		
		public static function isCookieSet(soName:String, label:String):Boolean {
			var so:SharedObject = SharedObject.getLocal(soName);
			
			if (so.data[label]) {
				return true;
			}
			
			return false;
		}
		
		public static function getCookie(soName:String, label:String):String {
			var so:SharedObject = SharedObject.getLocal(soName);
			
			return so.data[label];
		}
		
		public static function dispose():void {
			initialized = false;
			cookies = null;
		}
	}
}