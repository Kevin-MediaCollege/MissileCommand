package com.snakybo.misslecommand_prototype.object {
	import flash.events.Event;
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.util.Coord;

	import flash.display.MovieClip;

	/** @author Kevin */
	public class ObjectMissile extends MovieClip {
		private var missile:MovieClip;
		private var fireball:MovieClip;
		
		private var velHor:Number;
		private var velVer:Number;
		
		private var loopMc:Boolean;
		private var goesRight:Boolean;
		private var alphaUp:Boolean;
		
		public function ObjectMissile() {
			missile = new mc_missile();
			fireball = new Fireball();
			
			velHor = Math.random() * 1.5;
			velVer = Math.random() * 5 + 1;
			goesRight = Math.round(Math.random())
			
			missile.x = Math.floor(Math.random() * 1280);
			missile.y = -50;
			
			Game.main.addChild(missile);
			
			loopMc = true;
		}
		
		/** Loop */
		public function loop():void {
			if (loopMc) {
				var newX:Number;
				var newY:Number = missile.y += velVer;
				
				if(goesRight) {
					newX = missile.x += velHor;
				} else {
					newX = missile.x -= velHor;
				}
				
				missile.rotationZ = Coord.getDegreeFromPoint(missile.x, missile.y, newX, newY);
				missile.x = newX;
				missile.y = newY;
				
				for (var i:int = 0; i < Game.objects["towers"].length; i++) {
					if (Game.objects["towers"][i].hitTestPoint(missile.x, missile.y, true)) {
						destroy();
						break;
					}
				}
				
				if(Game.objects["terrain"][0].hitTestPoint(missile.x, missile.y, true)) {		
					destroy();
				} else if(missile.y >= 740 || missile.x > 1300 || missile.x < -20) {
					Game.main.removeChild(missile);
					Game.objects["missiles"].splice(Game.objects["missiles"].indexOf(this), 1);
				}
			}
		}
		
		/** Destroy */
		private function destroy():void {
			fireball.x = missile.x;
			fireball.y = missile.y;
			fireball.alpha = 0;
			alphaUp = true;
			
			Game.main.addChild(fireball);
			
			loopMc = false;
			
			Game.main.removeChild(missile);
			
			fireball.addEventListener(Event.ENTER_FRAME, loopFireball);
		}
		
		/** Loop fireball */
		private function loopFireball(e:Event):void {
			if(alphaUp) {
				fireball.alpha += 0.1;
			} else {
				fireball.alpha -= 0.1;
			}
			
			if(fireball.alpha >= 1) {
				alphaUp = false;
			} else if(fireball.alpha <= 0) {
				fireball.removeEventListener(Event.ENTER_FRAME, loopFireball);
				Game.main.removeChild(fireball);
				Game.objects["missiles"].splice(Game.objects["missiles"].indexOf(this), 1);
			}
		}
	}
}
