package com.snakybo.misslecommand.utils.math {
	
	public class Coord {
		/** @return Next X */
		public static function getNextX(x:Number, direction:Number, speed:Number):Number {
  			return x + (speed * Math.cos(direction * Math.PI / 180.0));
		}
		
		/** @return Next Y */
  		public static function getNextY(y:Number, direction:Number, speed:Number):Number {
   			return y + (speed * Math.sin(direction * Math.PI / 180.0));
 		}
		
		/** @return Distance between 2 points */
  		public static function getDistance(x1:Number, y1:Number, x2:Number, y2:Number):Number {
   			return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
  		}
		
		/** @return Degree between 2 points */
  		public static function getDegreeFromPoint(x1:Number, y1:Number, x2:Number, y2:Number):Number {
   			return Math.atan2((y2 - y1), (x2 - x1)) * 180 / Math.PI;
  		}
 	}
}