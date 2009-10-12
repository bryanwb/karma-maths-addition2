package{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	import flash.display.Graphics;

	
	public dynamic class Footer extends Sprite{
		
		var myText:TextField ;
		
		public function Footer(firstNumber:uint,secondNumber:uint):void{
			
			this.addChild(stringBox(String(uint(firstNumber/10)),this.x,this.y));
			this.addChild(stringBox(String(uint(firstNumber%10)),this.x+20,this.y));
			this.addChild(stringBox(String("+"),this.x-15,this.y+15));
			this.addChild(stringBox(String(uint(secondNumber/10)),this.x,this.y+15));
			this.addChild(stringBox(String(uint(secondNumber%10)),this.x+20,this.y+15));
			this.graphics.lineStyle(1,0xFF0000);	
			this.graphics.moveTo(this.x-15, this.y+33);
 
            this.graphics.lineTo(this.x+50, this.y+33);
			this.addChild(stringBox(String(uint((firstNumber+secondNumber)/10)),this.x,this.y+35));
			this.addChild(stringBox(String(uint((firstNumber+secondNumber)%10)),this.x+20,this.y+35));
			
		}
		public function stringBox(strText:String,x_pos:Number,y_pos:Number):TextField{			
			
			var myFormat:TextFormat = new TextFormat();
			
			myFormat.color= 0x006633;			
			myFormat.font = "Verdana";			
			myFormat.size = 12;
			myFormat.bold = true;
			myFormat.align = "center";
			myText = new TextField();
			myText.embedFonts = true;
			myText.height=20;
			myText.width=20;
			myText.defaultTextFormat = myFormat;			
			myText.text = strText;		
			
			trace(strText);
			myText.x=x_pos;
			myText.y=y_pos;
			return myText;
		}
		
		
	}
	
}