package com.snakybo.misslecommand_prototype {
	import com.snakybo.misslecommand.object.ObjectMissile;
	import com.snakybo.misslecommand.object.ObjectBullet;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.snakybo.misslecommand.object.ObjectTower;
	
	/** @author Kevin */
	public class Game extends MovieClip {
		public static var main:Main;
		public static var objects:Array;
		
		private var timer:Timer;
		
		public function Game(main:Main) {
			Game.main = main;
			
			objects = [];
			objects["terrain"] = [];
			objects["missiles"] = [];
			objects["towers"] = [];
			objects["bullets"] = [];
			
			// Add background
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0x0E99B1);
			bg.graphics.drawRect(0, 0, 1280, 720);
			bg.graphics.endFill();
			main.addChild(bg);
			
			// Add towers
			for (var i:int = 0; i < 4; i++) {
				objects["towers"].push(new ObjectTower(i * 350 + 50, 600));
			}
			
			// Add floor
			var floor:MovieClip = new mc_floor();
			floor.x = 0;
			floor.y = 614;
			objects["terrain"].push(main.addChild(floor));
			
			timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, spawn);
			timer.start();
		}
		
		/** Spawn asteroid */
		private function spawn(e:TimerEvent):void {
			objects["missiles"].push(new ObjectMissile());
		}
		
		/** Game loop */
		public function loop(e:Event):void {
			for each(var tower:ObjectTower in objects["towers"]) {
				tower.loop();
			}
			
			for each(var asteroid:ObjectMissile in objects["missiles"]) {
				asteroid.loop();
			}
			
			for each(var bullet:ObjectBullet in objects["bullets"]) {
				bullet.loop();
			}
		}
	}
}
