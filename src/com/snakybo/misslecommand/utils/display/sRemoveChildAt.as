package com.snakybo.misslecommand.utils.display {
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;

	public function sRemoveChildAt(parent:DisplayObjectContainer, atIndex:int = -1):DisplayObject {
		if(parent && parent.numChildren > 0) {
			if(atIndex < 0 || atIndex > parent.numChildren) {
				atIndex = parent.numChildren;
			}
			
			return parent.removeChildAt(atIndex);
		}
		
		return null;
	}
}
