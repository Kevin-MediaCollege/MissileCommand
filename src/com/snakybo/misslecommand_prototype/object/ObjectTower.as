package com.snakybo.misslecommand_prototype.object {
	import com.snakybo.misslecommand.util.Coord;
	import com.snakybo.misslecommand.Game;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/** @author Kevin */
	public class ObjectTower extends MovieClip {
		private var towerMc:MovieClip;
		private var gunMc:MovieClip;
		
		public function ObjectTower(x:int, y:int) {
			towerMc = new mc_tower();
			gunMc = new mc_tower_gun();
			
			towerMc.x = x;
			towerMc.y = y;
			
			gunMc.x = (towerMc.x + (towerMc.width / 2));
			gunMc.y = towerMc.y + 3;
			
			Game.main.addChild(gunMc);
			Game.main.addChild(towerMc);
			
			Game.main.stage.addEventListener(MouseEvent.CLICK, shoot);
		}
		
		public function loop():void {
			gunMc.rotation = Coord.getDegreeFromPoint(gunMc.x, gunMc.y, mouseX, mouseY) - 90;
		}
		
		/** Shoot */
		private function shoot(e:MouseEvent):void {
			Game.objects["bullets"].push(Game.main.addChild(new ObjectBullet(gunMc.x, gunMc.y, gunMc.rotation)));
		}
	}
}
