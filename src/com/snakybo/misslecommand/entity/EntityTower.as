package com.snakybo.misslecommand.entity {
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.util.Coord;
	import com.snakybo.misslecommand.world.World;
	import flash.events.MouseEvent;
	
	/** @author Kevin Krol */
	public class EntityTower extends Entity {
		public static const TOWER_GATLING:int = 1;
		public static const TOWER_ROCKET:int = 2;
		
		public var destroyed:Boolean;
		
		private var mc_gun:MovieClip;		
		private var towerID:int;
		private var cooldown:int;
		
		private var buttonDown:Boolean;
		
		public function EntityTower(towerID:int, mc:MovieClip, mc_gun:MovieClip, x:int, y:int, cooldown:int) {
			super(ENTITY_TOWER, mc, x, y);
			
			this.towerID = towerID;
			this.mc_gun = mc_gun;
			this.cooldown = cooldown;
			
			mc_gun.x = x;
			mc_gun.y = y - (mc_gun.height / 2) + 5;
			mc_gun.rotation = -mc_gun.rotation;
			
			Game.main.addChildAt(mc_gun, 1);
			
			Game.main.stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			Game.main.stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		/** Loop towers */
		private var tick:int;
		public override function loop():void {
			tick++;
						
			if (destroyed) {
				Game.main.stage.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
				Game.main.stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
				
				explode();
				
				Game.main.removeChild(mc_gun);
			}
			
			mc_gun.rotation = Coord.getDegreeFromPoint(mc_gun.x, mc_gun.y, mouseX, mouseY) - 270;
			
			if (buttonDown) {
				if (tick >= cooldown) {
					switch(towerID) {
					case TOWER_GATLING:
						World.missiles.push(new EntityMissile(mc_gun.x, mc_gun.y, mc_gun.rotation, 6));
						break;
					case TOWER_ROCKET:
						World.missiles.push(new EntityRocket(mc_gun.x, mc_gun.y, mc_gun.rotation, 15));
						break;
					}
					
					tick = 0;
				}
			}
		}
		
		/** On button down */
		private function onDown(e:MouseEvent):void {
			buttonDown = true;
		}
		
		/** On button up */
		private function onUp(e:MouseEvent):void {
			buttonDown = false;
		}
	}
}