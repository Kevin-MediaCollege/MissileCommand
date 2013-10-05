package com.snakybo.misslecommand.util {
	
	/** @author Kevin Krol */
	public class Vector3 {
		private var x:Number;
		private var y:Number;
		private var z:Number;
		
		public function Vector3(x:Number, y:Number, z:Number) {
			this.x = x;
			this.y = y;
			this.z = z;
		}
		
		/** @return Total length */
		public function length():Number {
			return Number(Math.sqrt(x * x + y * y + z * z));
		}
	
		/** @return Dot product */
		public function dot(r:Vector3):Number {
			return x * r.getX() + y * r.getY() + z * r.getZ();
		}
		
		/** @return Crossproduct of Vector3 */
		public function cross(r:Vector3):Vector3 {
			var _x:Number = y * r.getZ() - z * r.getY();
			var _y:Number = z * r.getX() - x * r.getZ();
			var _z:Number = x * r.getY() - y * r.getX();
			
			return new Vector3(_x, _y, _z);
		}
	
		/** @return Normalized Vector3 */
		public function normalized():Vector3 {
			var length:Number = length();
			
			return new Vector3(x / length, y / length, z / length);
		}
		
		/** @return Rotated Vector3 */
		public function rotate(angle:Number, axis:Vector3):Vector3 {
			var sinHalfAngle:Number = Number(Math.sin((angle / 2) * Math.PI / 180));
			var cosHalfAngle:Number = Number(Math.cos((angle / 2) * Math.PI / 180));
			
			var rX:Number = axis.getX() * sinHalfAngle;
			var rY:Number = axis.getY() * sinHalfAngle;
			var rZ:Number = axis.getZ() * sinHalfAngle;
			var rW:Number = cosHalfAngle;
			
			var rotation:Quaternion = new Quaternion(rX, rY, rZ, rW);
			var conjugate:Quaternion = rotation.conjugate();
			
			var w:Quaternion = rotation.mulv(this).mul(conjugate);
			
			return new Vector3(w.getX(), w.getY(), w.getZ());
		}
	
		/** @return Vector3 with specified Vector3 added to it */
		public function add(r:Vector3):Vector3 {
			return new Vector3(x + r.getX(), y + r.getY(), z + r.getZ());
		}
	
		/** @return Vector3 with specified floats added to it */
		public function addn(r:Number):Vector3 {
			return new Vector3(x + r, y + r, z + r);
		}
	
		/** @return Vector3 with specified Vector3 subtracted from it */
		public function sub(r:Vector3):Vector3 {
			return new Vector3(x - r.getX(), y - r.getY(), z - r.getZ());
		}
	
		/** @return Vector3 with specified floats subtracted from it */
		public function subn(r:Number):Vector3 {
			return new Vector3(x - r, y - r, z - r);
		}
	
		/** @return Vector3 multiplied with the specified Vector3 */
		public function mul(r:Vector3):Vector3 {
			return new Vector3(x * r.getX(), y * r.getY(), z * r.getZ());
		}
	
		/** @return Vector3 multiplied with the specified number */
		public function muln(r:Number):Vector3 {
			return new Vector3(x * r, y * r, z * r);
		}
		
		/** @return Vector3 divided by the specified Vector3 */
		public function div(r:Vector3):Vector3 {
			return new Vector3(x / r.getX(), y / r.getY(), z / r.getZ());
		}
	
		/** @return Vector3 multiplied with specified number */
		public function divn(r:Number):Vector3 {
			return new Vector3(x / r, y / r, z / r);
		}
	
		/** @return Absolute value of Vector3 */
		public function abs():Vector3 {
			return new Vector3(Math.abs(x), Math.abs(y), Math.abs(z));
		}
	
		/** Set X */
		public function setX(x:Number):void {
			this.x = x;
		}
	
		/** Set Y */
		public function setY(y:Number):void {
			this.y = y;
		}
		
		/** Set Z */
		public function setZ(z:Number):void {
			this.z = z;
		}
	
		/** @return X */
		public function getX():Number {
			return x;
		}

		/** @return Y */
		public function getY():Number {
			return y;
		}
		
		/** @return Z */
		public function getZ():Number {
			return z;
		}
	}
}