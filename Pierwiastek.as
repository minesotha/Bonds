package {
	
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	
	public class Pierwiastek extends Shape {
		public var currPierwiastek:Pierwiastek;
		public var nazwa:String;
		public var iloscWiazan:int;
		
		
		public function Pierwiastek(nazwa:String, iloscWiazan:int) {
			this.nazwa = nazwa;
			this.iloscWiazan = iloscWiazan;
			this.graphics.beginFill(0x000000,1);
			this.graphics.drawCircle(0,0,20);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onPierwiastekMouseDown);
			
		}
		
		public function makeColor(color:uint, alfa:uint){
			this.graphics.beginFill(color, alfa);
		}
		
		
		function onPierwiastekMouseDown(e:MouseEvent):void{
			var pierwiastek = e.target as Pierwiastek;
			currPierwiastek = pierwiastek;
			pierwiastek.startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, onPierwiastekMouseUp);
		}
		
		function onPierwiastekMouseUp(e:MouseEvent):void{
			//currPierwiastek.stopDrag();
			currPierwiastek=null;
			stage.removeEventListener(MouseEvent.MOUSE_UP, onPierwiastekMouseUp);
		}
	}
	
	
}
