package
{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import fl.controls.*;
	import flash.ui.Keyboard;
	
	public class Lesson extends MovieClip
	{
		
		static var tabCount:uint = 0;
		
		var currentNum:uint;
			
		/*//var ranArray:Array;		
		var activityTitle:Title;
		var tensTitle:Title;
		var onesTitle:Title;
		var mainStage:MainStage;
		var totalTitle:Title;
		var plusTitle:Title;*/
		
		var activityTitle:Title;
		var tensTitle:Title;
		var onesTitle:Title;
		var mainStage:MainStage;
		var totalTitle:Title;
		var plusTitle:Title;
		var question1:Question;
		
		
		
		
		var firstNumberArray:Array=new Array(26,18,37,29,16,56,28,36,34,38);
		var secondNumberArray:Array=new Array(5,4,6,6,5,6,14,29,16,28);
		var firstPicArray:Array=new Array("Pencil","Pencil","Biscuit","Stick","Marble","Marble","Stick","Biscuit","Stick","Pencil");
		var secondPicArray:Array=new Array("PencilBox","PencilBox","BiscuitPacket","StickPacket","MarbleCup","MarbleCup","StickPacket","BiscuitPacket","StickPacket","PencilBox");
		
		
		//var mcArray:Array=new Array("PencilBox","Pencil","MarbleCup2","Marble2","EraserBox3","Eraser3","MarbleCup4","Marble4","EraserBox5","Eraser5","PencilBox6","Pencil6");
		//var firstNumber:Array=new Array(46,38,45,52,44,17);
		//var secondNumber:Array=new Array(23,21,24,31,44,11);
		//var arrayTextBox:Array;
		
		var count:Number =0;
		var clickCount:Number;
		var myTimer:Timer = new Timer(2000, 1);
		
		var sound:Sound;	
		var channel:SoundChannel;
		
		function Lesson(questNum:uint)
		{
			trace(lessonStarting.ranArray);
			
			
			currentNum=questNum;		
			count=lessonStarting.ranArray[questNum];
			//ranArray=new Array();
			//ranArray=generateRandomNumber(0, questionArray.length);
			//trace(ranArray);
			showQuestion();		
			//sound=new Sound();
			//sound.load(new URLRequest("title.mp3"));
			//channel=sound.play(0,1);
			//this.getOption(currentNum);	
		}
		
		function showQuestion()
		{
			
			activityTitle=new Title("hf]8 / pQ/ n]v",120,25,350,1);
			tensTitle=new Title("b;",20-30,46,350,1);
			onesTitle=new Title("Ps",290-30,46,350,1);
			mainStage=new MainStage();
			mainStage.x=300-3;
			mainStage.y=231;
			
			this.addChild(mainStage);
			this.addChild(activityTitle);
			this.addChild(tensTitle);
			this.addChild(onesTitle);			
			
			question1 =new Question(firstNumberArray[count],secondNumberArray[count],firstPicArray[count],secondPicArray[count]);			
			this.addChild(question1);
			
			plusTitle=new Title("+",0,30,80,0);
			plusTitle.x=-10;
			plusTitle.y=220;
			this.addChild(plusTitle);
			totalTitle=new Title("hDdf",0,30,80,1);
			//totalTitle.x=-145;
			totalTitle.y=350;
			this.addChild(totalTitle);		
			
		}
		
		
		
		
		
		
	
		
	}//end of class
}//end of package