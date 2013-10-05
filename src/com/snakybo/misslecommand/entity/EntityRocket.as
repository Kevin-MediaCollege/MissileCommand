package com.snakybo.misslecommand.entity {
	import flash.display.MovieClip;
	import flash.sampler.NewObjectSample;
	
	/** @author Kevin Krol */
	public class EntityRocket extends Entity {
		public function EntityRocket(x:int, y:int, rotation:Number, speed:Number) {
			super(ENTITY_ROCKET, new mc_tower_rocket_missile(), x, y, rotation, speed);
		}
	}
}