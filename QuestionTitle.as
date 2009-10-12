package{
	import flash.display.*;
	import flash.media.*;
	import flash.text.*;
	
	public class QuestionTitle extends MovieClip{
		
		
		var x_pos,y_pos:uint;
		var characterCounter:uint=0;
		
		//var flag:Number;
		
		public function QuestionTitle(strArray:Array,x_val:uint,y_val:uint,pattern:String):void{
			
			trace(pattern);
			this.x_pos=x_val;
			this.y_pos=y_val;		
			/*for(var i=0;i<strArray.length;i++){
				stringBox(strArray[i],x_pos+=10,y_pos,pattern.charAt(i));
			}*/
						
			
			var myFormat:TextFormat = new TextFormat();
			//myFormat.bold = true;			
			myFormat.align = TextFormatAlign.JUSTIFY;
			//myFormat.color= 0x0066FF;
			myFormat.color=0x006633;
			myFormat.font = "Verdana";
			myFormat.size = 13;
					
			/*var myTextSn:TextField = new TextField();
			//myText.height = textBoxHeight;
			//myTextSn.width = 275;
			myTextSn.autoSize = TextFieldAutoSize.LEFT;			
			myTextSn.embedFonts = true;
			myTextSn.selectable=false;
			myTextSn.defaultTextFormat = myFormat;
			myTextSn.x=x_pos;	
			myTextSn.y=y_pos;
			myTextSn.text=strArray[0];
			*/
			
			var myText:TextField = new TextField();
			//myText.height = textBoxHeight;
			myText.width = 260;
			myText.wordWrap=true;
			myText.embedFonts = true;
			myText.selectable=false;
			myText.defaultTextFormat = myFormat;
			//myText.x=x_pos+myTextSn.width;		
			myText.x=x_pos;
			myText.y=y_pos-3;	
			
			for (var i = 0; i < strArray.length ; i++)
			{
				
				if(pattern.charAt(i)=="n")
				{
					myFormat.font = "Kantipur";		
					myFormat.size =20;
				}
				else
				{
					myFormat.font = "Verdana";
					myFormat.size = 13;
				}
				myText.appendText(strArray[i]);
				myText.setTextFormat(myFormat,characterCounter,characterCounter+strArray[i].length);
				characterCounter = characterCounter + strArray[i].length;				
			}
			//addChild(myTextSn);
			addChild(myText);			
		}
		
		
		public function stringBox(strText:String,xpos:uint,ypos:uint,flag:String):void{			
			
			var myText:TextField = new TextField();
			var myFormat:TextFormat = new TextFormat();
			//myFormat.color= 0x006633;
			myFormat.color= 0x0066FF;
			//#0066FF
			
			myText.x=xpos;			
			if(flag == "n"){
				
				myFormat.font = "Kantipur";		
				myFormat.size =20;
				myText.y=ypos-3;
				myText.height=30;
			}
			else{
				
				//trace("choose font");
				myFormat.font = "Verdana";
				myFormat.size = 13;
				myText.y=ypos;
			}
			
			
			
			
			
			myText.embedFonts = true;
			myText.autoSize = TextFieldAutoSize.LEFT;
			myText.defaultTextFormat = myFormat;			
			myText.text = strText;				
			//myText.background=true;
			this.x_pos+=myText.width;
			
			//return myText;
			
			this.addChild(myText);
		}
		
		
	}
	
}