package com.crowdpark.sushiman.utils
{
	/**
	 * @author sandberg
	 */
	public class StringGenerator
	{
		public static function generateString(maxLength:int):String
		{
			var letters:String = "a,b,c,d,e,f,g,h,ij,k,l,m,n,o,p,q,r,s,t,u,v,x,y,z";
			var chars:Array = letters.split(",");
			var rndLength:int = int(Math.random() * maxLength);
			var str:String = "";
			
			for(var i:int = 0; i<rndLength; i++)
			{
				str += chars[int(Math.random()*chars.length)];
			}
			return str;
			
		}
	}
}
