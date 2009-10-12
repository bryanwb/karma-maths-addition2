package{
 	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
	import flash.external.*;
	//import fl.controls.*;
	
	
	public class Starting extends Sprite
	{
		
		static var pwd:String;
		static var levelNo : uint;
		var conn:LocalConnection;		
		var excerciseArray:Array=new Array();
		var activityName:String = new String();
		
		static var firstNumberArray:Array=new Array(35,26,36,58,36,48,56,28,46,25,28,65,16,63,27,16,22,26,17,86,49,82,78,56,35,48, 9,57,35,17);
		static var secondNumberArray:Array=new Array(9,28, 7, 6,57,43, 8,14,39,25,47,28,45,18, 9,49,39,44,63, 8,49, 9,17,47, 8,22,73,33,45,28);
		static var ranArray:Array;
		
		
		function Starting()
		{	
			ranArray=new Array();
			ranArray=generateRandomNumber(0, 30);
			
			//connection part will be here.........
			activityName = "Main";
			conn = new LocalConnection();
            conn.client = this;
            try 
			{
                conn.connect(activityName);
            } 
			catch (error:ArgumentError) 
			{
				var temptemp : TextField = new TextField();
				temptemp.text ="Can't connect to Activity...the connection name is already being used by another SWF";
				addChild(temptemp);
            }
			
			conn.addEventListener(StatusEvent.STATUS, onStatus);
										
			//listenLevel(1);
						
			
		}
		public function destroyActivity():void
		{
			conn.close();		
		
		}
	
		private function onStatus(evt:StatusEvent):void //dealing with status
		{
			switch (evt.level) 
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
				case "warning":
					{
						//trace("warning");
					}
            }
	 	}
		
		public function listenLevel(lNo:uint,path:String)
		{
			pwd = path;
			excerciseArray = new Array();
			levelNo = lNo;
			
			for(var i : uint = 0; i < 10; i++)//hoping there are 10 elements excerciseArray
				excerciseArray.push("f");//f is inserted to mark it is first time
				
			conn.send("FRAMEWORK", "getNumExerciseTab", excerciseArray.length);//calling FRAMEWORK for returning number of tab in Lesson window..
			listenQuestion(1,pwd);
			
		}
		
		public function listenQuestion(sNo:uint, path:String)//called by FRAMEWORK for changing question
		{
			pwd = path;
			
			for(var i=0;i<this.numChildren;i++)//removing from vision... not destroying
				this.removeChildAt(0);
			
			if(excerciseArray[sNo-1] != "f")//not for first time
			{
				this.addChild(excerciseArray[sNo-1]);//load already loaded from excerciseArray
			}
			else//for first time
			{				
				excerciseArray[sNo-1]=new Excercise(sNo-1);//loads new sprite
				this.addChild(excerciseArray[sNo-1]);
				
			}	
			
		}
		
		private function randomRange(low:Number, high:Number):int
		{
			return Math.floor(Math.random() * (high - low)) + low;
		}
		
		private function generateRandomNumber(low:Number, high:Number):Array{
			
			var arr:Array=new Array();
			
			while(arr.length<10)
			{
				var i:int;
				var ran:Number=randomRange(low, high);
				var flag:Boolean=false;
				for (i = 0; i <=arr.length; i++)
				{
					if(ran==arr[i])
						flag=true;
				}
				 if (!flag)
				 {
					arr.push(ran);
				 }
				
				
			}
			return arr;
			
		}
		
	}			
	
}