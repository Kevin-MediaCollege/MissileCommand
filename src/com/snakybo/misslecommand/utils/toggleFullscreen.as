package com.snakybo.misslecommand.utils {
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	
	public function toggleFullscreen(stage:Stage):String {
		var state:String;
		
		switch(stage.displayState) {
		case StageDisplayState.FULL_SCREEN_INTERACTIVE:
			state = StageDisplayState.NORMAL;
			break;
		case StageDisplayState.NORMAL:
			state = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			break;
		}
		
		stage.displayState = state;
		
		return state;
	}
}