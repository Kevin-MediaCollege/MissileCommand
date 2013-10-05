package com.snakybo.misslecommand.entity {
	
	/** @author Kevin Krol */
	public class EntityTowerRocket extends EntityTower {
		public function EntityTowerRocket(x:int, y:int) {
			super(TOWER_ROCKET, new mc_tower_rocket(), new mc_tower_gatling_gun(), x, y, 15);
		}
	}
}