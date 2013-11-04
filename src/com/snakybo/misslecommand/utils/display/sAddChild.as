package com.snakybo.misslecommand.utils.display {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public function sAddChild(child:DisplayObject, parent:DisplayObjectContainer, atIndex:int = -1):Boolean {
		if(child && parent) {
			if(atIndex < 0 || atIndex > parent.numChildren) {
				atIndex = parent.numChildren;
			}
			
			parent.addChildAt(child, atIndex);
			return true;
		}
		
		return false;
	}	
}
