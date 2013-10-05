package com.snakybo.misslecommand.entity {
	import flash.display.MovieClip;
	import flash.sampler.NewObjectSample;
	
	/** @author Kevin Krol */
	public class EntityMissile extends Entity {
		public function EntityMissile(x:int, y:int, rotation:Number, speed:Number) {
			super(ENTITY_MISSILE, new mc_tower_gatling_missile(), x, y, rotation, speed);
		}
	}
}