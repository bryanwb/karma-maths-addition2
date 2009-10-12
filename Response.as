package{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	
	public dynamic class Response extends Sprite{
		var sprite1:Sprite;// = new Sprite();
		var myText:TextField ;
		public function Response(str_m_text:String):void{
			sprite1 = new Sprite();			
			sprite1.addChild(string_box(str_m_text));			
			sprite1.x=100;
			sprite1.y=100;
			addChild(sprite1);
			
		}
		public function string_box(str_text:String):TextField{
			
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			myFormat.font = "Verdana";			
			myFormat.size = 24;
			myFormat.bold = true;
			myFormat.align = "center";
			myText = new TextField();
			myText.embedFonts = true;
			myText.height=160;
			myText.width=400;
			myText.defaultTextFormat = myFormat;
			//myText.autoSize = TextFieldAutoSize.CENTER;
			//myText.antiAliasType = AntiAliasType.ADVANCED;
			myText.text = str_text;			
			myText.wordWrap=true;
			return myText;
		}
		
		public function clear_text():void{
			myText.text="";
		}
			
	}
	
}