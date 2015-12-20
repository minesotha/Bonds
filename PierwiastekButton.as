package  {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
		import flash.display.Shape;

	
	public class PierwiastekButton extends Shape {
		
		public var currDrag:Pierwiastek;
		public var nazwa:String;
		
		public function PierwiastekButton(nazwa:String, color:int) {
			this.nazwa = nazwa;
			this.graphics.beginFill(color,1);
			this.graphics.drawRect(10,10,100,100);
		}
		
	}
	
}
