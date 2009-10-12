package
{
 	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
	import flash.external.*;

	public class lessonStarting extends Sprite
	{
		static var pwd:String;
		var conn:LocalConnection;
		var lessonArray:Array=new Array();
		static var tabCount:uint=0;
		static var ranArray:Array;
		
		function lessonStarting()
		{
			
			ranArray=new Array();
			ranArray=generateRandomNumber(0, 6);
			
			conn = new LocalConnection();
            conn.client = this;
            try 
			{
                conn.connect("LESSON");//naming connection for calling this swf file.......
            } 
			catch (error:ArgumentError) 
			{
				trace(error);

            }		
			for(var i:uint=0;i<6;i++)//hoping there are 3 elements excerciseArray
				lessonArray.push("f");
				
			conn.addEventListener(StatusEvent.STATUS, onStatus);
			conn.send("FRAMEWORK","getNumLessonTab",lessonArray.length);//calling FRAMEWORK for returning number of tab in Lesson window..	
			
			//showLesson(1);
		
		}
		
		private function onStatus(event:StatusEvent):void 
		{
            switch (event.level) 
			{
                case "status":
                 {   
				 	//trace("LocalConnection.send() succeeded");
					break;
				 }
				case "error":
				{
                    //trace("LocalConnection.send() failed");
					break;
				}
            }
	 	}
		
		public function showLesson(num:uint,path:String):void
		{
				pwd = path;
				for(var i=0;i<this.numChildren;i++)
					this.removeChildAt(0);
					
				if(lessonArray[num-1] != "f")//not for first time
				{
					this.addChild(lessonArray[num-1]);
				}
				else//for first time
				{
					lessonArray[num-1] = new Lesson(num-1);	
					
					
					//var lesson:Lesson=new Lesson(); 
					/*switch(num)
					{
						case 1:
						lessonArray[num-1] = new Lesson;			
						lessonArray[num-1].gotoAndStop(1);
						break;
						
						case 2:
						lessonArray[num-1] = new Lesson;
						lessonArray[num-1].gotoAndStop(2);
						break;
						
						case 3:
						lessonArray[num-1] = new Lesson;			
						lessonArray[num-1].gotoAndStop(3);
						break;
					}*/
					
					this.addChild(lessonArray[num-1]);
					
				}
		}
		
		private function randomRange(low:Number, high:Number):int
		{
			return Math.floor(Math.random() * (high - low)) + low;
		}
		
		private function generateRandomNumber(low:Number, high:Number):Array{
			
			var arr:Array=new Array();
			
			while(arr.length<6)
			{
				var i:int;
				//var ran:Number=Math.round(Math.random()*100);
				var ran:Number=randomRange(low, high);
				var flag:Boolean=false;
				for (i = 0; i <=arr.length; i++)
				{
					//trace(Math.round(Math.random()*10));
					
					if(ran==arr[i])
						flag=true;
				}
				 if (!flag)
				 {
					arr.push(ran);
				 }
				
				
			}
			
			//trace("arr at random"+arr)
			return arr;
			
		}
		
	}//end of class
}//end of package