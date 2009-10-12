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
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	public class Excercise extends MovieClip
	{
		var currentNum:uint;
		var count:uint=0;				
		
		var animation:Anim;
		var myText,myText1,myTextR:TextInput;
		var firstNumber:uint=0;
		var secondNumber:uint=0;
		var imgCheck:Check=new Check();
		var hitCounter:Boolean;
		
		var sound:Sound;
		var channel:SoundChannel;
		
		function Excercise(questNum:uint)
		{			
			currentNum=questNum;	
			firstNumber=Starting.firstNumberArray[Starting.ranArray[currentNum]];
			secondNumber=Starting.secondNumberArray[Starting.ranArray[currentNum]];
			hitCounter=true;
			
			myText=new TextInput();		
			myTextR=new TextInput();
			myText1=new TextInput();		
			getQuestion();							
		}
		
		private function getQuestion():void
		{			
			
			trace("enter get question");
			
			animation=new Anim();
			animation.stop();
			animation.play();
			this.addChild(animation);			
			this.addEventListener(Event.ENTER_FRAME, onLoop, false, 0, true);			
		}
		
		private function onLoop(evt:Event):void 
		{
			
			if(animation.currentFrame==40)
			{
				this.removeEventListener(Event.ENTER_FRAME, onLoop);						
				this.addChild(getNumber(firstNumber,240,75));
				
				animation.gotoAndPlay(41);
				this.addEventListener(Event.ENTER_FRAME, onLoop, false, 0, true);
			}
			
			if(animation.currentFrame==90)
			{
				this.removeEventListener(Event.ENTER_FRAME, onLoop);
				this.addChild(getNumber(secondNumber,240,130));
				
				this.addChild(string_box("+",218,145,1,"0x0066FF"));
				var sp:Sprite = new Sprite();				
				var g:Graphics = sp.graphics;
				g.lineStyle(2, 0x0066FF);
				g.moveTo(220, 190);
				g.lineTo(295, 190);
				addChild(sp);
				
				this.getTextInput(260,195);
			}			
		}
		
		private function getTextInput(x_pos:uint,y_pos:uint):void
		{			
			var myFormat:TextFormat = new TextFormat();			
			myFormat.font = "Verdana";
			myFormat.size = 20;			
			myFormat.color= 0x006633;
			myFormat.align=TextFormatAlign.CENTER;					
			
			myText.height=30;
			myText.width=25;				
			myText.setStyle("textFormat", myFormat);	
			myText.setStyle("disabledTextFormat", myFormat);	
			myText.restrict="0-9";
			myText.maxChars=1;			
			myText.x=x_pos;
			myText.y=y_pos;				
			myText.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			myText.addEventListener(KeyboardEvent.KEY_DOWN, keyMoved);
			this.addChild(myText);
			//myText.setFocus();
			
			
			myTextR.height=30;
			myTextR.width=25;				
			myTextR.setStyle("textFormat", myFormat);	
			myTextR.setStyle("disabledTextFormat", myFormat);	
			myTextR.restrict="0-9";
			myTextR.maxChars=1;			
			myTextR.x=x_pos-25;
			myTextR.y=y_pos-153;				
			myTextR.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			myTextR.addEventListener(KeyboardEvent.KEY_DOWN, keyMoved);
			this.addChild(myTextR);
			
			
			myText1.height=30;
			myText1.width=25;				
			myText1.setStyle("textFormat", myFormat);	
			myText1.setStyle("disabledTextFormat", myFormat);	
			myText1.restrict="0-9";
			myText1.maxChars=1;			
			myText1.x=x_pos-28;
			myText1.y=y_pos;			
			myText1.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			myText1.addEventListener(KeyboardEvent.KEY_DOWN, keyMoved);
			
			//this.addChild(myText);
			this.addChild(myText1);
		}
		
		
		private function getNumber(id:uint,x_pos:uint,y_pos:uint):MovieClip
		{
			var mcNum:MovieClip;
			mcNum=new MovieClip();
			mcNum=buildQuestion(id);
			mcNum.x=x_pos;
			mcNum.y=y_pos;
			mcNum.tabEnabled=false;			
			return mcNum;
		}
		
		private function buildQuestion(id:uint):MovieClip
		{		
			
			var mcCoconut:Coconut=new Coconut();
			mcCoconut.scaleX=3.5;
			mcCoconut.scaleY=3.5;			
			
			var myFormat:TextFormat = new TextFormat();			
			myFormat.font = "Verdana";
			myFormat.size = 6;
			myFormat.bold = true;
			myFormat.color= 0x006633;
			myFormat.align=TextFormatAlign.CENTER;		
			
			var myText:TextField=new TextField();				
			myText.embedFonts = true;
			myText.autoSize = TextFieldAutoSize.LEFT;
			myText.selectable=false;
			myText.defaultTextFormat = myFormat;				
			myText.text = String(id);
			if(id<10)
				myText.x=mcCoconut.x+4;
			else
				myText.x=mcCoconut.x;
			
			myText.y=mcCoconut.y+3;
			
			mcCoconut.addChild(myText);
			return mcCoconut;
		}
		
		
		public function string_box(str_text:String,x_pos:uint,y_pos:uint,font:uint,txtColor:String="0x006633"):TextField
		{
		
		
			var myFormat:TextFormat = new TextFormat();			
			myFormat.color=txtColor;
			if(font==0)
			{			
				myFormat.font = "kantipur";			
				myFormat.size = 20;
				myFormat.bold = true;
			}
			else
			{
				myFormat.font = "Verdana";			
				myFormat.size = 20;
			}			
			myFormat.align = "center";
			var myText:TextField = new TextField();
			myText.embedFonts = true;
			myText.defaultTextFormat = myFormat;
			myText.autoSize = TextFieldAutoSize.LEFT;
			myText.selectable=false;
			myText.text = str_text;			
			myText.x=x_pos;
			myText.y=y_pos;
			return myText;
		}
		
		
		function keyMoved(evt:KeyboardEvent):void
		{		
			if(this.contains (imgCheck) )
				this.removeChild(imgCheck);
		}
		
		function keyPressed(evt:KeyboardEvent):void
		{		
			var conn:LocalConnection= new LocalConnection();//for calling function of FRAMEWORK
			
			if (evt.keyCode == Keyboard.ENTER ) 
			{							
				
				if(myText.text != "" && myText1.text != "" && myTextR.text != "")
				{				
					imgCheck.x=325;
					imgCheck.y=150;
					imgCheck.scaleX=.3;
					imgCheck.scaleY=.3;				
					
					if((int(myText1.text)*10+int(myText.text)) == (this.firstNumber+this.secondNumber) && int(myTextR.text) == int((this.firstNumber%10+this.secondNumber%10)/10) )
					{
						imgCheck.gotoAndStop(1);
						myText.enabled=false;
						myText1.enabled=false;
						myTextR.enabled=false;
						animation.gotoAndPlay(91);
						
						var mc:MovieClip = new MovieClip();
						mc=getNumber((firstNumber+secondNumber),240,195);
						this.addChild(mc);
 						
						var obj:Tween;					
						obj = new Tween(mc,"y",Strong.easeIn,mc.y,285,1,true);						
						obj.start();						
						if(hitCounter)
							conn.send("FRAMEWORK","changeScore",currentNum+1,true);
						
						sound=new Sound();
						sound.load(new URLRequest("sound/right.mp3"));
						channel=sound.play(0,1);		
					}
					else
					{
						hitCounter = false;
						imgCheck.gotoAndStop(2);
						animation.gotoAndPlay(121);
						conn.send("FRAMEWORK","changeScore",currentNum+1,false);
						
						sound=new Sound();
						sound.load(new URLRequest("sound/wrong.mp3"));
						channel=sound.play(0,1);		
					}
					this.addChild(imgCheck);	
				}
			}
		}	
		
		
	}//end of class
}//end of package