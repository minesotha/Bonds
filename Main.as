package  {
				
import flash.events.MouseEvent;
import flash.display.MovieClip;
import flash.events.Event;
import flash.display.Sprite;

	
	public class Main extends MovieClip {
		
		public var currDrag:Pierwiastek;
		
		public function Main() {
			S_btn.addEventListener(MouseEvent.MOUSE_DOWN, onBtnMouseDown);
			var x = new PierwiastekButton("S", 0xFFFF00);
			x.x = 100;
			x.y = 100;
			x.addEventListener(MouseEvent.MOUSE_DOWN, onBtnMouseDown);
			stage.addChild(x);
			
			}
			
			function onBtnMouseDown(e:MouseEvent):void{
				var btn = e.target;
				var s:Pierwiastek= new Pierwiastek(btn.name, 2);
				s.x = mouseX;
				s.y = mouseY;
				currDrag=s;
				stage.addChild(s);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onPierwiastekMouseMove);
				stage.addEventListener(MouseEvent.MOUSE_UP, onBtnMouseUp);
			}
			
			function onPierwiastekMouseMove(e:MouseEvent):void{
				
				currDrag.x = mouseX;
				currDrag.y = mouseY;
				
			}
			
			function onBtnMouseUp (e:MouseEvent):void{
				trace(currDrag.nazwa);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, onPierwiastekMouseMove);
				//currDrag.stopDrag();
				currDrag = null;
				stage.removeEventListener(MouseEvent.MOUSE_UP, onBtnMouseUp);
			}

	}
	
}

