package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Bond extends Sprite
	{
		public var curr:Element;
		public var last:Element;
		
		public function Bond(currentTarget,lastTarget)
		{
			curr=currentTarget;
			last=lastTarget;
			
				curr.AddBond(this);
				last.AddBond(this);
		
				super();
				
				this.graphics.lineStyle(5, 0xFF0000, 1);
				
			
		}
		
		public function RemoveBond(){
			this.curr.RemoveBond(this);
			this.last.RemoveBond(this);
			this.parent.removeChild(this);
			
		}
		
	
		
	
	}
}