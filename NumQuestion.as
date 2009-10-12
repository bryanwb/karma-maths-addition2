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
	
	
	public class NumQuestion extends Sprite{			
		
		var firstNumber,secondNumber:int;
		var onesText1,tensText1:TextInput;
		var returnAnswer:Boolean=false;		
		
		
		function NumQuestion(firstNumber:Number,secondNumber:Number):void
		{								
			
			
			this.firstNumber=firstNumber;
			this.secondNumber=secondNumber;
			
			var shapes:Sprite = new Sprite();
			var line:Sprite = new Sprite();
			var gr:Graphics = shapes.graphics;
			var g:Graphics = line.graphics;
			
			//this.addChild(showText(String(int(firstNumber%10)),400,105));			
			//this.addChild(showText(String(int(firstNumber/10)),195,105));
			
			//this.addChild(showText(String(int(secondNumber%10)),400,195));
			//this.addChild(showText(String(int(secondNumber/10)),195,195));
			
			gr.beginFill(0xE6FAD1, .7);
			gr.drawRoundRect(30,-160,300,200,50);
			gr.endFill();
			shapes.x = 150;
			shapes.y = 250;
			addChild(shapes);
			
			this.addChild(showText(String(int(firstNumber%10)),350,105));			
			this.addChild(showText(String(int(firstNumber/10)),250,105));
			this.addChild(showText(String("+"),200,160));
			this.addChild(showText(String(int(secondNumber%10)),350,160));
			if(int(secondNumber/10)>0)
				this.addChild(showText(String(int(secondNumber/10)),250,160));
			
			g.lineStyle(2, 0xFF0000);
			g.moveTo(405, 223);
			g.lineTo(250, 223);
			this.addChild(line);
			
			this.addChild(showText(String(int((firstNumber+secondNumber)%10)),350,230));			
			this.addChild(showText(String(int((firstNumber+secondNumber)/10)),250,230));
			
			
			
			//showTextEntry();
		}
		
		
		public function showText(str_text:String,x_pos:Number,y_pos:Number,border:Boolean=false):TextField
		{			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x025286;
			myFormat.font = "Verdana";
			myFormat.size = 42;			
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
			onesText1=new TextInput();			
			onesText1.restrict = "0-9";
			onesText1.maxChars = 1;
			onesText1.width = 30;
			onesText1.height = 20;	
			onesText1.x=400+25/2;
			onesText1.y=285;
			
			tensText1=new TextInput();
			tensText1.restrict = "0-9";
			tensText1.maxChars = 1;
			tensText1.width = 30;
			tensText1.height = 20;	
			tensText1.x=195+25/2;
			tensText1.y=285;
			
			//onesText1.setFocus();
			
			this.addChild(onesText1);
			//onesText1.setFocus();
			//tensText.setFocus();
			this.addChild(tensText1);
			//onesText.setFocus();
			//tensText.setFocus();
		}
	
		public function getResult():Boolean{
			return this.returnAnswer;
		}
		
		public function setText():void {			
		
			if(int(onesText1.text)==(uint((firstNumber+secondNumber)%10)) && int(tensText1.text)==uint((firstNumber+secondNumber)/10))
				this.returnAnswer=true;		
			else 
				this.returnAnswer=false;
				
		
		}
		
		
		
	}	
	
	
	
	
}