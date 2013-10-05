package com.snakybo.misslecommand_prototype.object {
	import com.snakybo.misslecommand.util.Coord;
	import com.snakybo.misslecommand.Game;
	import flash.display.MovieClip;
	
	/** @author Kevin */
	public class ObjectBullet extends MovieClip {
		private var bullet:MovieClip;
		
		private var direction:Number;
		
		public function ObjectBullet(x:int, y:int, direction:Number) {
			this.direction = direction + 90;
			
			bullet = new mc_bullet();
			
			bullet.x = x;
			bullet.y = y;
			
			Game.main.addChild(bullet);
		}
		
		public function loop():void {
			bullet.x = Coord.getNextX(bullet.x, direction, 3);
			bullet.y = Coord.getNextY(bullet.y, direction, 3);
			
			for (var i:int = 0; i < Game.objects["missiles"].length; i++) {
				if (Game.objects["missiles"][i].hitTestPoint(bullet.x, bullet.y, true)) {
					Game.main.removeChild(bullet);
					Game.objects["bullets"].splice(Game.objects["bullets"].indexOf(this), 1);
				}
			}
			
			if(bullet.y >= 740 || bullet.x > 1300 || bullet.x < -20) {
				Game.main.removeChild(bullet);
				Game.objects["bullets"].splice(Game.objects["bullets"].indexOf(this), 1);
			}
		}
	}
}
