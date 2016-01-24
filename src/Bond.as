package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	public class Bond extends Sprite
	{
		public var curr:Element;
		public var last:Element;
		private var allBonds:ArrayCollection =new ArrayCollection;
		
		
		public function Bond(currentTarget,lastTarget)
		{
			curr=currentTarget;
			last=lastTarget;
			
				curr.AddBond(this);
				last.AddBond(this);
		
				super();
				
				this.graphics.lineStyle(5, 0x89D289, 1);
				allBonds.addItem(this);
				
			
		}
		
		public function RemoveBond(){
			
			this.curr.RemoveBond(this);
			this.last.RemoveBond(this);
			this.parent.removeChild(this);
			var  i = allBonds.getItemIndex(this);
			allBonds.removeItemAt(i);
			
			
		}
		
		public function Update(){
			for each (var bond:Bond in allBonds){
				if(bond != this){
				if(bond.curr == this.curr || bond.last == this.last){
					bond.graphics.clear();
					bond.graphics.lineStyle(5, 0x899028, 1);
					bond.graphics.moveTo(bond.x+55, bond.y+55);
					bond.graphics.lineTo(bond.x+55, bond.y+55);
				}
			}
			}
			
		}
	
		
	
	}
}