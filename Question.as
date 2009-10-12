package{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	import flash.net.*;
	import flash.events.*;
	import flash.utils.*;	
	import flash.events.MouseEvent;
	import fl.controls.TextInput;
	import flash.ui.Keyboard;
	
	
	public class Question extends Sprite{			
		
		var onesFirstNumber,onesSecondNumber,onesTotal,onesCarry,tensFirstNumber,tensSecondNumber,tensTotal:DrawObject;
		var onesTarget,tensTarget:Sprite;		
		var flag:uint=0;
		var hitCounterOnesFirst:uint=0;
		var hitCounterOnesSecond:uint=0;
		var hitCounterTensFirst:uint=0;
		var hitCounterTensSecond:uint=0;
		var hitCounterCarry:uint=0;
		var onesObjectCount:uint=0;
		var tensObjectCount:uint=0;
		var carryOver:uint=0;
		var onesAnswer:uint=0;
		var tensAnswer:uint=0;
		var firstNumber,secondNumber:uint;
		var firstPic,secondPic:String;
		var dragable:Boolean=false;
		var onesText,tensText:TextInput;
		var returnAnswer:Boolean=false;		
		
		var maxOnes,maxTens:uint;
		var chkImg:Check=new Check();;
		var sound:Sound;	
		var channel:SoundChannel;
		
		function Question(firstNumber:uint,secondNumber:uint,firstPic:String,secondPic:String):void {								
			
			
			this.firstNumber=firstNumber;
			this.secondNumber=secondNumber;
			this.firstPic=firstPic;
			this.secondPic=secondPic;
			
			
			//maxOnes=greatest(uint(firstNumber%10),uint(secondNumber%10))
			if(uint(firstNumber%10)>uint(secondNumber%10))
				maxOnes=uint(firstNumber%10);
			else
				maxOnes=uint(secondNumber%10);
				
			if(uint(firstNumber/10)>uint(secondNumber/10))
				maxTens=uint(firstNumber%10);
			else
				maxTens=uint(secondNumber%10);
						
			onesTarget = new Sprite();
			onesTarget.graphics.beginFill(0xF9EDD2);
			onesTarget.graphics.drawRect(305, 255, 240, 90);
			onesTarget.name = "onesTarget";			
			addChild(onesTarget);
			
			tensTarget = new Sprite();
			tensTarget.graphics.beginFill(0xE6FAD1);
			tensTarget.graphics.drawRect(40, 255, 240, 90);
			tensTarget.name = "tensTarget";			
			addChild(tensTarget);

			onesFirstNumber=new DrawObject(firstNumber%10,firstPic,maxOnes);
			onesFirstNumber.x=430;
			onesFirstNumber.y=105;
			this.addChild(onesFirstNumber);
			onesFirstNumber.addEventListener(MouseEvent.CLICK, dragOnesFirst);		
			this.addChild(onesFirstNumber);
			
			onesSecondNumber=new DrawObject(secondNumber%10,firstPic,maxOnes);
			onesSecondNumber.x=430;
			onesSecondNumber.y=195;
			this.addChild(onesSecondNumber);
			onesSecondNumber.addEventListener(MouseEvent.CLICK, dragOnesSecond);		
			
			tensFirstNumber=new DrawObject(firstNumber/10,secondPic,maxTens);
			tensFirstNumber.x=160;
			tensFirstNumber.y=105;
			this.addChild(tensFirstNumber);
			tensFirstNumber.addEventListener(MouseEvent.CLICK, dragTensFirst);		
			this.addChild(tensFirstNumber);
			
			tensSecondNumber=new DrawObject(secondNumber/10,secondPic,maxTens);
			tensSecondNumber.x=160;
			tensSecondNumber.y=195;
			this.addChild(tensSecondNumber);
			tensSecondNumber.addEventListener(MouseEvent.CLICK, dragTensSecond);		
			
			
		}
		
		function dragOnesFirst(event:MouseEvent):void
		{
			//trace(onesFirstNumber.myText.text+"adgasg");
			
			if(this.contains(onesFirstNumber.myText))
			{
				//this.removeChild(onesFirstNumber.myText);
				onesFirstNumber.removeText();
			}
			
			if(flag==0){								
				onesFirstNumber.startDrag();				
				flag=1;
			}
			else
			{				
				onesFirstNumber.stopDrag();
				flag=0;				
				try 
				{				
					if(onesFirstNumber.dropTarget.name=="onesTarget")
					{						
						if(hitCounterOnesFirst==0)
						{
							onesAnswer+=onesFirstNumber.getNumber();
							onesObjectCount++;
							this.addChild(showText(String(onesFirstNumber.getNumber()),430-30,105));
						}
						hitCounterOnesFirst++;						
					}
					else
					{
						
						onesFirstNumber.x=430;
						onesFirstNumber.y=105;
					}
				}
				catch(e:Error) 
				{
					onesFirstNumber.x=430;
					onesFirstNumber.y=105;
				}											
			}
			if(onesObjectCount==2)
			{
				showOnesTotal();
			}			
		}
		
		function dragOnesSecond(mouseEvent:MouseEvent):void
		{
			
			if(this.contains(onesSecondNumber.myText))
			{
				//this.removeChild(onesFirstNumber.myText);
				onesSecondNumber.removeText();
			}
			
			if(flag==0){
				onesSecondNumber.startDrag();				
				flag=1;
			}
			else
			{				
				onesSecondNumber.stopDrag();
				flag=0;				
				
				try 
				{
					if(onesSecondNumber.dropTarget.name=="onesTarget")
					{
						if(hitCounterOnesSecond==0)
						{
							onesAnswer+=onesSecondNumber.getNumber();
							onesObjectCount++;
							this.addChild(showText(String(onesSecondNumber.getNumber()),430-30,195));
						}
						hitCounterOnesSecond++;
					}
					else
					{
						onesSecondNumber.x=430;
						onesSecondNumber.y=195;
					}
				}
				catch(e:Error) 
				{					
					onesSecondNumber.x=430;
					onesSecondNumber.y=195;
				}			
				
				
			}
			if(onesObjectCount==2)
			{
				showOnesTotal();
			}
			
		}
		
		function dragTensFirst(mouseEvent:MouseEvent):void
		{
			if(this.contains(tensFirstNumber.myText))
			{
				//this.removeChild(onesFirstNumber.myText);
				tensFirstNumber.removeText();
			}
			
			
			if(dragable)
			{			
				if(flag==0){
					tensFirstNumber.startDrag();				
					flag=1;
				}
				else
				{									
					tensFirstNumber.stopDrag();
					flag=0;									
					try 
					{
						if(tensFirstNumber.dropTarget.name=="tensTarget")
						{
							if(hitCounterTensFirst==0)
							{
								tensAnswer+=tensFirstNumber.getNumber();
								tensObjectCount++;
								this.addChild(showText(String(tensFirstNumber.getNumber()),160-30,105));
								showTensTotal(1);
							}
							hitCounterTensFirst++;
						}
						else
						{
							tensFirstNumber.x=160;
							tensFirstNumber.y=105;
						}
					}
					catch(e:Error) 
					{					
						//trace("enter catch");
						tensFirstNumber.x=160;
						tensFirstNumber.y=105;
					}								
				}				
			}
		}
		
		function dragTensSecond(mouseEvent:MouseEvent):void
		{			
			
			if(this.contains(tensSecondNumber.myText))
			{
				//this.removeChild(onesFirstNumber.myText);
				tensSecondNumber.removeText();
			}
			
			if(dragable)
			{
				if(flag==0){
					tensSecondNumber.startDrag();				
					flag=1;
				}
				else
				{				
					tensSecondNumber.stopDrag();
					flag=0;				
					
					try 
					{
						if(tensSecondNumber.dropTarget.name=="tensTarget")
						{
							if(hitCounterTensSecond==0)
							{
								tensAnswer+=tensSecondNumber.getNumber();
								tensObjectCount++;
								this.addChild(showText(String(tensSecondNumber.getNumber()),160-30,195));
								showTensTotal(2);
							}
							hitCounterTensSecond++;
						}
						else
						{
							tensSecondNumber.x=160;
							tensSecondNumber.y=195;
						}
					}
					catch(e:Error) 
					{					
						tensSecondNumber.x=160;
						tensSecondNumber.y=195;
					}			
					
				}
			}
			
		}
		
		function dragCarry(mouseEvent:MouseEvent):void
		{			
			
				if(flag==0){
					onesCarry.startDrag();				
					flag=1;
				}
				else
				{				
					onesCarry.stopDrag();
					flag=0;				
					
					try 
					{
						if(onesCarry.dropTarget.name=="tensTarget")
						{
							if(hitCounterCarry==0)
							{
								tensAnswer+=onesCarry.getNumber();
								carryOver++;
								//this.addChild(showText(String(onesCarry.getNumber()),10,75,true,36));
								
								var myFormat:TextFormat = new TextFormat();
								myFormat.color= 0x006633
								myFormat.font = "Verdana";
								myFormat.size = 20;			
								myFormat.align = "center";
								var myText:TextField = new TextField();
								myText.height=25;
								myText.width=25;			
								myText.defaultTextFormat = myFormat;			
								
								myText.border=true;
								myText.text = String(onesCarry.getNumber());			
								myText.wordWrap=true;			
								myText.x=20;			
								myText.y=75;			
								this.addChild(myText);
								
							}
							hitCounterCarry++;
						}
						else
						{
							onesCarry.x=375;
							onesCarry.y=295;
						}
					}
					catch(e:Error) 
					{					
						onesCarry.x=375;
						onesCarry.y=295;
					}			
					if(carryOver==1)
					{
						showTensGrandTotal();
					}		
					
				}
					
		}
		
		function showOnesTotal():void
		{
			
			this.removeChild(onesFirstNumber);
			this.removeChild(onesSecondNumber);
			if(onesAnswer<10)
			{
				onesTotal=new DrawObject(onesAnswer,firstPic,maxOnes);
				onesTotal.x=430;
				onesTotal.y=295;
				onesTotal.removeText();
				this.addChild(onesTotal);
				
			}
			else
			{
				onesTotal=new DrawObject(int(onesAnswer)%10,firstPic,maxOnes,182);
				onesTotal.x=461;
				onesTotal.y=295;
				onesTotal.removeText();
				this.addChild(onesTotal);
				
				
				onesCarry=new DrawObject(int(onesAnswer)/10,secondPic,1,100);
				onesCarry.x=340;
				onesCarry.y=295;
				onesCarry.addEventListener(MouseEvent.CLICK, dragCarry);	
				onesCarry.removeText();
				this.addChild(onesCarry);				
				//carryObject.addEventListener(MouseEvent.CLICK, Drag);		
				
			}
			
			
			
		}
		
		function showTensTotal(mod:uint):void
		{
			//trace("enter tens totalhere"+mod);
				
				if(mod==1)
				{
					
					this.removeChild(tensFirstNumber);
					this.removeChild(tensTotal);
					
				}
				
				if(mod==2)
				{
					//this.removeChild(onesCarry);
					this.removeChild(tensSecondNumber);
					this.removeChild(tensTotal);
				}
				//this.removeChild(tensSecondNumber);
				
				tensTotal=new DrawObject(tensAnswer,secondPic,maxTens);			
				tensTotal.x=160;
				tensTotal.y=295;
				tensTotal.removeText();
				this.addChild(tensTotal);		
				//dragable=true;
				//trace(onesAnswer);
				//trace(tensAnswer);
				if((uint(firstNumber/10)==0||uint(secondNumber/10)==0)&&tensObjectCount==1)
				{
					showTextEntry();
				}
				else if(tensObjectCount==2)
				{
					showTextEntry();
				}
			
		}
		
		function showTensGrandTotal():void
		{
			//trace("enter here");			
			//this.removeChild(onesCarry);
			//this.removeChild(tensTotal);
			//this.removeChild(tensSecondNumber);
			this.removeChild(onesCarry);
			
			tensTotal=new DrawObject(tensAnswer,secondPic,maxTens);			
			tensTotal.x=160;
			tensTotal.y=295;
			tensTotal.removeText();
			this.addChild(tensTotal);		
			
			//trace(onesAnswer);
			//trace(tensAnswer);
			dragable=true;
			//showTextEntry();
		}
		
		public function showText(str_text:String,x_pos:Number,y_pos:Number,border:Boolean=false,size:uint=42):TextField
		{			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			myFormat.font = "Verdana";
			myFormat.size = size;			
			myFormat.align = "center";
			var myText:TextField = new TextField();
			myText.height=60;
			myText.width=60;			
			myText.defaultTextFormat = myFormat;			
			if(border)
				myText.border=true;
			myText.text = str_text;			
			myText.wordWrap=true;			
			myText.x=x_pos;			
			myText.y=y_pos;			
			return myText;
		}
		
		public function showTextEntry()
		{
			onesText=new TextInput();			
			onesText.restrict = "0-9";
			onesText.maxChars = 1;
			onesText.width = 25;
			onesText.height = 18;	
			onesText.x=430;
			onesText.y=360;
			onesText.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			//onesText.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
			
			tensText=new TextInput();
			tensText.restrict = "0-9";
			tensText.maxChars = 1;
			tensText.width = 25;
			tensText.height = 18;	
			tensText.x=160;
			tensText.y=360;
			tensText.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			//tensText.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
			
			this.addChild(onesText);
			
			onesText.setFocus();
			//tensText.setFocus();
			this.addChild(tensText);
			//onesText.setFocus();
		}
	
		public function getResult():Boolean{
			return this.returnAnswer;
		}
		
		public function setText():void {			
		
			if(int(onesText.text)==(uint((firstNumber+secondNumber)%10)) && int(tensText.text)==uint((firstNumber+secondNumber)/10))
				this.returnAnswer=true;		
			else 
				this.returnAnswer=false;
				
		
		}
		
		public function removeText():void
		{
			this.removeChild(onesText);
			this.removeChild(tensText);
		}
		
		
		public function keyPressed(evt:KeyboardEvent):void 
		{
			if (evt.keyCode == Keyboard.ENTER ) 
			{	
				if(this.contains(chkImg))
					this.removeChild(chkImg);
				
				
				if(onesText.text != "" && tensText.text != "")
				{
					
					//chkImg=new Check();
					//chkImg.gotoAndStop(1);
					chkImg.x=300;
					chkImg.y=230;
					chkImg.alpha=.7;
					
					if((int(tensText.text)*10+int(onesText.text)) == (firstNumber + secondNumber))
					{
						
						chkImg.gotoAndStop(1);
						this.addChild(chkImg);
					
						sound=new Sound();
						sound.load(new URLRequest("sound/right.mp3"));
						channel=sound.play(0,1);
						
						/*for(var i=0;i<2;i++)
						{
							arrayTextBox[i].textInput.removeEventListener(KeyboardEvent.KEY_UP, keyPressed);
							arrayTextBox[i].textInput.editable=false;
						}*/
						var numQuestion:NumQuestion=new NumQuestion(firstNumber,secondNumber);
						numQuestion.x=-35;
						this.addChild(numQuestion);
					}
					else 
					{
						chkImg.gotoAndStop(2);
						sound=new Sound();
						sound.load(new URLRequest("sound/wrong.mp3"));
						channel=sound.play(0,1);
						//myTimer.addEventListener(TimerEvent.TIMER, resetQuestion);
						//myTimer.start();
						this.addChild(chkImg);
					
					}
					
				}
				
				//trace(evt.currentTarget.text);
			}
		}
		
		
		
	}	
	
	
	
	
}