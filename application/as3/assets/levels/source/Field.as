﻿package{	/**	 * @author szalwinski	 */	public class Field	{		public var type:String;		public var x:Number;		public var y:Number;		public var id:Number;				public function toString():String		{			return '{'+			'"id":' + id + "," +			'"x":'  + Math.floor(x) + "," +			'"y":'  + Math.floor(y) + "," +			'"type":' + '"' + type +  '"' + "}";		}	}}