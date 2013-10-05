package com.snakybo.misslecommand.util {

	public class Quaternion {
		private var x:Number;
		private var y:Number;
		private var z:Number;
		private var w:Number;
		
		public function Quaternion(x:Number, y:Number, z:Number, w:Number) {
			this.x = x;
			this.y = y;
			this.z = z;
			this.w = w;
		}

		/** @return Total length of the Quaternion */
		public function length():Number {		
			return Number(Math.sqrt(x * x + y * y + z * z + w * w));
		}
		
		/** Normalize the Quaternion */
		public function normalize():Quaternion {
			var length:Number = length();
			
			return new Quaternion(x / length, y / length, z / length, w / length);
		}
		
		/** Conjugate the Quaternion */
		public function conjugate():Quaternion {
			return new Quaternion(-x, -y, -z, w);
		}
		
		/** Multiply with the specified Quarternion */
		public function mul(r:Quaternion):Quaternion {
			var _w:Number = w * r.getW() - x * r.getX() - y * r.getY() - z * r.getZ();
			var _x:Number = x * r.getW() + w * r.getX() + y * r.getZ() - z * r.getY();
			var _y:Number = y * r.getW() + w * r.getY() + z * r.getX() - x * r.getZ();
			var _z:Number = z * r.getW() + w * r.getZ() + x * r.getY() - y * r.getX();
			
			return new Quaternion(_x, _y, _z, _w);
		}
		
		/** Multiply with the specified Vector3 */
		public function mulv(r:Vector3):Quaternion {
			var _w:Number = -x * r.getX() - y * r.getY() - z * r.getZ();
			var _x:Number =  w * r.getX() + y * r.getZ() - z * r.getY();
			var _y:Number =  w * r.getY() + z * r.getX() - x * r.getZ();
			var _z:Number =  w * r.getZ() + x * r.getY() - y * r.getX();
			
			return new Quaternion(_x, _y, _z, _w);
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
		
		/** Set W */
		public function setW(w:Number):void {
			this.w = w;
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

		/** @return W */
		public function getW():Number {
			return w;
		}
	}
}