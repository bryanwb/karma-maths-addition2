package{
	import flash.display.*;
	//import flash.display.Sprite;
	import flash.media.*;
	import flash.text.*;
	import flash.net.*;
	import flash.events.*;	
	import flash.ui.Keyboard;
	
	
	public class DrawObject extends Sprite
	{
		
		
		var count:Number;		
		var mcName:String;
		var maxNum:uint; 
		//var mc
		var spriteHt:Number=60;
		var spriteWt:Number;
			
		public var myText:TextField=new TextField();
 
		public function DrawObject(count:int,mcName:String,maxNum:uint,spriteWt:Number=242):void 
		{
		
			this.count=count;	
			this.mcName=mcName;
			this.spriteWt=spriteWt;
			this.maxNum=maxNum;
			//var mc:Pencil=new Pencil();		
			//trace(spriteWt);
			var mc:Objects=new Objects();
			//mc=new PencilBox();
			switch(mcName)
			{
			
				case "Marble" :{
					//mc.stop();
					trace("enter here");
					mc.gotoAndStop(3);
					break;
				}
				case "MarbleCup" :{
					//mc.stop();
					mc.gotoAndStop(4);
					break;		
				}
				case "PencilBox" :{
					//mc.stop();
					mc.gotoAndStop(2);
					break;
				}
				case "Pencil" :{
					//mc.stop();
					mc.gotoAndStop(1);
					break;		
				}
				case "BiscuitPacket" :{
					//mc.stop();
					mc.gotoAndStop(5);
					break;
				}
				case "Biscuit" :{
					//mc.stop();
					mc.gotoAndStop(6);
					break;		
				}
				case "StickPacket" :{
					//mc.stop();
					mc.gotoAndStop(7);
					break;
				}
				case "Stick" :{
					//mc.stop();
					mc.gotoAndStop(8);
					break;		
				}
				case "BaseTenBlock" :{
					//mc.stop();
					mc.gotoAndStop(9);
					break;
				}
				case "Block" :{
					//mc.stop();
					mc.gotoAndStop(10);
					break;		
				}
			}
			//mc.stop();
			
			//trace(mc.width);
			//trace(mc.height);
			
			//var mc:PencilBox=new PencilBox();		
			//var ratioX=mc.width*this.count/spriteWt;
			var ratioX=mc.width*this.maxNum/spriteWt;			
			var ratioY=mc.height/spriteHt;
			//trace("x:"+ratioX);
			//trace("x:"+ratioY);
			
			var scale:Number;			
			if(ratioX>ratioY)
				scale=ratioX;
			else
				scale=ratioY;
				
			if(mc.width/mc.height<.1 && count>5)
				spriteWt=spriteWt/2;
			if(mc.width/mc.height<.1 && count<=5)
				spriteWt=spriteWt/4;
			
				
			var step:Number=spriteWt/(count+1);			
			mc.scaleX=1/scale;			
			if (step<mc.width/.95)
			{				
				scale=scale/.75;
			}
			var temp:Number=-spriteWt/2+step;			
			//var showMc:Pencil;
			//var showMc:PencilBox;
			for(var i=0;i<count;i++)
			{
				trace(mcName);
				//showMc=new Pencil();
				var showMc:Objects=new Objects();		
				
				switch(mcName)
				{
				
					case "Marble" :{
					//mc.stop();
					showMc.gotoAndStop(3);
					break;
					}
					case "MarbleCup" :{
						//mc.stop();
						showMc.gotoAndStop(4);
						break;		
					}
					case "PencilBox" :{
						//mc.stop();
						showMc.gotoAndStop(2);
						break;
					}
					case "Pencil" :{
						//mc.stop();
						showMc.gotoAndStop(1);
						break;		
					}
					case "BiscuitPacket" :{
					//mc.stop();
						showMc.gotoAndStop(5);
						break;
					}
					case "Biscuit" :{
						//mc.stop();
						showMc.gotoAndStop(6);
						break;		
					}
					case "StickPacket" :{
						//mc.stop();
						showMc.gotoAndStop(7);
						break;
					}
					case "Stick" :{
						//mc.stop();
						showMc.gotoAndStop(8);
						break;		
					}
					case "BaseTenBlock" :{
						//mc.stop();
						showMc.gotoAndStop(9);
						break;
					}
					case "Block" :{
						//mc.stop();
						showMc.gotoAndStop(10);
						break;		
					}
					
				}
				
				
				//showMc=new PencilBox();		
				showMc.scaleX=1/scale;
				showMc.scaleY=1/scale;
				showMc.x=temp;			
				temp+=step;
				//trace("mc i:"+i+":"+showMc.x);
				this.addChild(showMc);
			}
			this.buttonMode=true;
			
			
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			myFormat.font = "Verdana";
			myFormat.size = 12;			
			myFormat.bold=true;
			myFormat.align = "center";
			myText = new TextField();
			myText.height=20;
			myText.width=spriteWt;			
			myText.defaultTextFormat = myFormat;			
			myText.text =String(count);			
			myText.wordWrap=true;			
			myText.x=-spriteWt/2;			
			myText.y=35;			
			
			
			
			if(count>0)
				this.addChild(myText);
			//this.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			//this.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
		}	
		
		public function showText(str_text:String):TextField
		{			
			var myFormat:TextFormat = new TextFormat();
			myFormat.color= 0x006633
			myFormat.font = "Verdana";
			myFormat.size = 12;			
			myFormat.bold=true;
			myFormat.align = "center";
			myText = new TextField();
			myText.height=20;
			myText.width=spriteWt;			
			myText.defaultTextFormat = myFormat;			
			myText.text = str_text;			
			myText.wordWrap=true;			
			myText.x=-spriteWt/2;			
			myText.y=35;			
			return myText;
		}
		
		public function getNumber():Number
		{
			return this.count;
		}
		
		public function removeText():void
		{
			this.removeChild(myText);
		}
		function rollOverHandler(event:MouseEvent):void
		{
			this.addChild(showText(String(count)));
		}
		
		function rollOutHandler(event:MouseEvent):void
		{
			this.removeChild(myText);
		}
	}
	
}