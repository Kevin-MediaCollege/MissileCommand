package com.snakybo.misslecommand.util {
	
	/** @author Kevin Krol */
	public class Vector2 {
		private var x:Number;
		private var y:Number;
		
		public function Vector2(x:Number, y:Number) {
			this.x = x;
			this.y = y;
		}
		
		/** @return Total length */
		public function length():Number {
			return Number(Math.sqrt(x * x + y * y));
		}
	
		/** @return Dot product */
		public function dot(r:Vector2):Number {
			return x * r.getX() + y * r.getY();
		}
	
		/** @return Normalized Vector2 */
		public function normalized():Vector2 {
			var length:Number = length();
			
			return new Vector2(x / length, y / length);
		}
		
		/** @return Rotated Vector2 */
		public function rotate(angle:Number):Vector2 {
			var rad:Number = angle * Math.PI / 180
			var cos:Number = Math.cos(rad);
			var sin:Number = Math.sin(rad);
			
			return new Vector2((x * cos - y * sin),(x * sin + y * cos));
		}
	
		/** @return Vector2 with specified Vector2 added to it */
		public function add(r:Vector2):Vector2 {
			return new Vector2(x + r.getX(), y + r.getY());
		}
	
		/** @return Vector2 with specified floats added to it */
		public function addn(r:Number):Vector2 {
			return new Vector2(x + r, y + r);
		}
	
		/** @return Vector2 with specified Vector2 subtracted from it */
		public function sub(r:Vector2):Vector2 {
			return new Vector2(x - r.getX(), y - r.getY());
		}
	
		/** @return Vector2 with specified floats subtracted from it */
		public function subn(r:Number):Vector2 {
			return new Vector2(x - r, y - r);
		}
	
		/** @return Vector2 multiplied with the specified Vector2 */
		public function mul(r:Vector2):Vector2 {
			return new Vector2(x * r.getX(), y * r.getY());
		}
	
		/** @return Vector2 multiplied with the specified number */
		public function muln(r:Number):Vector2 {
			return new Vector2(x * r, y * r);
		}
		
		/** @return Vector2 divided by the specified Vector2 */
		public function div(r:Vector2):Vector2 {
			return new Vector2(x / r.getX(), y / r.getY());
		}
	
		/** @return Vector2 multiplied with specified number */
		public function divn(r:Number):Vector2 {
			return new Vector2(x / r, y / r);
		}
	
		/** @return Absolute value of Vector2 */
		public function abs():Vector2 {
			return new Vector2(Math.abs(x), Math.abs(y));
		}
	
		/** Set X */
		public function setX(x:Number):void {
			this.x = x;
		}
	
		/** Set Y */
		public function setY(y:Number):void {
			this.y = y;
		}
	
		/** @return X */
		public function getX():Number {
			return x;
		}

		/** @return Y */
		public function getY():Number {
			return y;
		}
	}
}