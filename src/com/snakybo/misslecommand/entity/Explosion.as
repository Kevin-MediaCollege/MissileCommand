package com.snakybo.misslecommand.entity {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import com.snakybo.misslecommand.utils.display.sRemoveChild;
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	
	/** @author Kevin Krol */
	public class Explosion extends MovieClip {
		private var mc:MovieClip;
		private var up:Boolean;
		
		public function Explosion(x:int, y:int, entityID:int) {
			mc = new Fireball();
			mc.x = x;
			mc.y = y;
			
			switch (entityID) {
			case 1:
				mc.scaleX = 2;
				mc.scaleY = 2;
				break;
			case 3:
				mc.scaleX = 4;
				mc.scaleY = 4;
				break;
			case 4:
				mc.scaleX = 3;
				mc.scaleY = 3;
				break;
			}
			
			mc.alpha = 0;
			up = true;
			
			sAddChild(mc, Game.main);
		}
		
		/** Loop explosion */
		public function  loop():void {
			if (up) {5
				mc.alpha += 0.05;
				
				if (mc.alpha >= 1) {
					up = false;
				}
			} else {
				mc.alpha -= 0.05;
				
				if (mc.alpha <= 0) {
					sRemoveChild(mc, Game.main);
					World.explosions.splice(World.explosions.indexOf(this), 1);
				}
			}
		}
	}
}