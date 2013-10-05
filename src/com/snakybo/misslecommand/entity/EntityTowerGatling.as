package com.snakybo.misslecommand.entity {
	
	/** @author Kevin Krol */
	public class EntityTowerGatling extends EntityTower {
		public function EntityTowerGatling(x:int, y:int) {
			super(TOWER_GATLING, new mc_tower_gatling(), new mc_tower_gatling_gun(), x, y, 5);
		}
	}
}