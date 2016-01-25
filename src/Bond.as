package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	
	public class Bond extends Sprite
	{
		public var curr:Element;
		public var last:Element;
		private static var allBonds:ArrayCollection =new ArrayCollection();
		
		
		public function Bond(currentTarget,lastTarget)
		{
			curr=currentTarget;
			last=lastTarget;
			
				curr.AddBond(this);
				last.AddBond(this);
		
				super();
				
				
				this.graphics.lineStyle(5, 0x89D289, 1);
				if(getSimBondsNumber()>0){
					switch (getSimBondsNumber()){
						case 1:
							this.graphics.moveTo(curr.x+30, curr.y+30);
							this.graphics.lineTo(last.x+30, last.y+30);
							break;
						case 2:
							this.graphics.moveTo(curr.x+40, curr.y+40);
							this.graphics.lineTo(last.x+40, last.y+40);
							break;
						case 3:
							this.graphics.moveTo(curr.x+60, curr.y+60);
							this.graphics.lineTo(last.x+60, last.y+60);
							break;
						case 4:
							this.graphics.moveTo(curr.x+70, curr.y+70);
							this.graphics.lineTo(last.x+70, last.y+70);
							break;
						case 5:
							this.graphics.moveTo(curr.x+80, curr.y+80);
							this.graphics.lineTo(last.x+80, last.y+80);
							break;
						case6:
							this.graphics.moveTo(curr.x+20, curr.y+20);
							this.graphics.lineTo(last.x+20, last.y+20);
							break;
					}
					
				}
				else{
				
				this.graphics.moveTo(curr.x+50, curr.y+50);
				this.graphics.lineTo(last.x+50, last.y+50);
				}
				allBonds.addItem(this);
				
			
		}
		
		/** ile jest podobnych wiazan */
		private function getSimBondsNumber():Number{
			var num = 0;
			for each (var bond:Bond in allBonds){
				if(this.curr === bond.curr && this.last === bond.last){
					num++;
				}
					else if( this.curr === bond.last || this.last === bond.curr){
					num++;
				}
			}
			
			return num;
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