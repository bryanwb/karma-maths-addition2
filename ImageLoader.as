package{
	import flash.display.*;
	//import flash.display.Sprite;
	import flash.media.*;
	import flash.text.*;
	import flash.net.*;
	import flash.events.*;
	import fl.controls.TextInput;
	import flash.ui.Keyboard;
	
	
	public class ImageLoader extends Sprite{
		
		
		var answer:Number;
		var isClickAble:Boolean;
		var imgNumber:Number;
		var imgWt:Number;
		var imgHt:Number;
		var side:Number;
		var returnAnswer:Boolean;
		
		
		var spriteHt:Number;
		var spriteWt:Number;
		var imgname:String;
		var y_pos:Number;
		var x_pos:Number;
		
		public var textInput:TextInput;
		var mc:MovieClip;	
		
		//var hitCount:Number=0;
		
		//var sound:Sound;	
		//var channel:SoundChannel;
		
 
		public function ImageLoader(mcName:String,frameNumber:Number,answer:Number,side:Number,isClickAble:Boolean):void {
		
		
		this.answer=answer;
		this.isClickAble=isClickAble;
		this.side=side;
		
		//this.useHandCursor = true;		
		textInput=new TextInput();	
		
		switch(mcName){
			
			case "PencilBox" :
				mc=new PencilBox();
				break;
			case "Pencil" :
				mc=new Pencil();
				break;		
			case "MarbleCup2" :
				mc=new MarbleCup2();
				break;
			case "Marble2" :
				mc=new Marble2();
				break;		
			case "EraserBox3" :
				mc=new EraserBox3();
				break;
			case "Eraser3" :
				mc=new Eraser3();
				break;		
			case "MarbleCup4" :
				mc=new MarbleCup4();
				break;
			case "Marble4" :
				mc=new Marble4();
				break;		
			case "EraserBox5" :
				mc=new EraserBox5();
				break;
			case "Eraser5" :
				mc=new Eraser5();
				break;		
			case "PencilBox6" :
				mc=new PencilBox6();
				break;
			case "Pencil6" :
				mc=new Pencil6();
				break;		
		}			
		
		mc.stop();
		mc.gotoAndStop(frameNumber);		
		this.imgWt=mc.width;
		this.imgHt=mc.height;	
		
		//trace(imgWt);
		mc.addEventListener(MouseEvent.CLICK, onClick);		
		//mc.tabEnabled=false;
		this.addChild(mc);	
		
		}
			
		public function showText(str_text:String):TextField{			
			
			var myText:TextField=new TextField();
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			myFormat.font = "Verdana";
			myFormat.size = 12;			
			myFormat.align = "center";
			myText = new TextField();
			myText.height=20;
			myText.width=imgWt;			
			myText.defaultTextFormat = myFormat;			
			myText.text = str_text;			
			myText.wordWrap=true;
			//if(side==0)
			myText.x=-imgWt/2;
			//else
				//myText.x=0;
			myText.y=35;			
			return myText;
		}
		
		public function showInput(){	
			
			//textInput=new TextInput();			
			textInput.restrict = "0-9";
			textInput.maxChars = 1;
			textInput.width = 25;
			textInput.height = 18;			
			if(side==0)
				textInput.x=-25/2;
			else
				textInput.x=-25/2;
			textInput.y=35;	
			textInput.tabIndex=Lesson.tabCount++;
			//textInput.text="qweqwe";
			
			//textInput.addEventListener(KeyboardEvent.KEY_UP, keyPressed);
			//textInput.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);


			this.addChild(textInput);
			textInput.setFocus();
			
		}
		
		public function getResult():Boolean{
			return this.returnAnswer;
		}
		
		public function setText():void {			
		trace("enter roll over");
			if(int(textInput.text)==this.answer)
				this.returnAnswer=true;		
			else 
				this.returnAnswer=false;	
				
		trace(this.returnAnswer);
			
		}
		
		
		public function focusOutHandler(event:FocusEvent):void {			
			if(int(textInput.text)==this.answer)
				this.returnAnswer=true;		
			else 
				this.returnAnswer=false;	
			
		}
		/*public function keyPressed(event:KeyboardEvent):void {
			if (event.keyCode == Keyboard.ENTER ) 
			{				
				if(int(textInput.text)==this.answer)
				{
					if(this.side=0)
						Lesson.onesAnswer=true;
					else
						Lesson.tensAnswer=true;
				}
					//this.returnAnswer=true;		
				else 
				{
					if(this.side=0)
						Lesson.onesAnswer=false;
					else
						Lesson.tensAnswer=false;
					
				}
				Lesson.ansCount++;
				
				if(ansCount==2)
				{
					if(Lesson.onesAnswer && Lesson.tensAnswer)
					{
						chkImg=new Check();
						chkImg.gotoAndStop(1);
						chkImg.x=300;
						chkImg.y=230;
						this.addChild(chkImg);
						
						//myTimer.addEventListener(TimerEvent.TIMER, resetQuestion);
						///myTimer.start();
					}
					
					
					
				}
					//this.returnAnswer=false;		
			}
			
		}
		*/
		
		
		public function onClick(event:MouseEvent):void{
			
			
				
			if(isClickAble)
				this.addChild(showText(String(answer)));
			else
				showInput();
			
			mc.removeEventListener(MouseEvent.CLICK, onClick);		
			
		}
		
		
	}
	
}