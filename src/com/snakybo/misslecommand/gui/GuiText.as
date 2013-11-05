package com.snakybo.misslecommand.gui {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import com.snakybo.misslecommand.Game;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.utils.Dictionary;
	import flash.text.GridFitType;
	
	/** @author Kevin Krol */
	public class GuiText extends Sprite {
		private var textFormat:TextFormat;
		private var textField:TextField;
		
		public function GuiText(text:String, x:Number, y:Number, size:uint = 24, color:uint = 0xFFFFFF) {
			textFormat = new TextFormat();
			textField = new TextField();
			
			textFormat.color = color;
			textFormat.font = "Verdana";
			textFormat.size = size;
			
			textField.antiAliasType = AntiAliasType.ADVANCED;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.gridFitType = GridFitType.NONE; 
			textField.defaultTextFormat = textFormat;
			textField.mouseEnabled = false;
			textField.selectable = false;
			textField.text = text;
			textField.x = x;
			textField.y = y;
			
			textField.setTextFormat(textFormat);
			
			sAddChild(textField, Game.main);
		}
		
		public function setText(text:String):void {
			textField.text = text;
		}
	}
}