package com.snakybo.misslecommand.utils.display {
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;

	public function sRemoveChild(child:DisplayObject, parent:DisplayObjectContainer):DisplayObject {
		if(child) {
			if(!parent) {
				if(!child.parent) {
					return null;
				}
				
				parent = child.parent;
			}
			
			if(parent == child.parent) {
				parent.removeChild(child);
				return child;
			}
		}
		
		return null;
	}
}
