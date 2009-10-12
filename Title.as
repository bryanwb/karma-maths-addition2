package{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	
	public dynamic class Title extends Sprite{
		
		var myText:TextField ;
		var flag:Number;
		var titleWt:Number;
		
		public function Title(strTitle:String,x_val:Number=100,y_val:Number=30,titleWt:Number=350,f:Number=0):void{
			this.x=x_val;
			this.y=y_val;
			this.flag=f;
			this.titleWt=titleWt;
			this.addChild(stringBox(strTitle));
			
			//trace(strTitle+this.flag);
			
		}
		public function stringBox(strText:String):TextField{			
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			if(flag == 1){
				
				myFormat.font = "Kantipur";		
				myFormat.size = 24;
			}
			else{
				myFormat.font = "Verdana";
				myFormat.size = 15;
			}
			
			myFormat.bold = true;
			myFormat.align = "center";
			myText = new TextField();
			myText.embedFonts = true;
			myText.height=60;
			myText.width=this.titleWt;
			myText.defaultTextFormat = myFormat;			
			myText.text = strText;			
			myText.wordWrap=true;
			return myText;
		}
		
		public function clearText():void{
			myText.text="";
		}
			
	}
	
}