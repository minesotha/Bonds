package
{
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	
	import flashx.textLayout.debug.assert;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Image;
	
	public class Element extends Image
	{
		public var isSelected:Boolean;
		
		private var bondCount:uint;
		public var currBondCount;
		public var bonds:ArrayCollection = new ArrayCollection;
		
		
		/** stwórz nowy pierwiastek
		 * @param source źródło obrazka
		 * @param bondCount ilość wiązań
		 */
		public function Element(source:String, bondCount)
		{
			super();
			
			this.bondCount = bondCount;
			currBondCount = 0;
			
			this.source=source;
			isSelected=false;
			this.width  = 100;
			this.height = 100;
			
		}
		public function Select():void{
			this.isSelected=true;
			this.alpha = 0.5;
		}
		public function Unselect():void{
			this.isSelected=false;
			this.alpha = 1.0;
		}
		
		
		
		public function AddBond(bond:Bond){
			
			bonds.addItem(bond);
				this.currBondCount++;
	
		}
		
		public function RemoveBond(bond:Bond){
			var index = bonds.getItemIndex(bond);
			bonds.removeItemAt(index);
			currBondCount--;
			
		}
		
		public function RemoveAllBonds(){
			for each (var bond:Bond in bonds){
				bond.RemoveBond();
			}
			bonds = new ArrayCollection;
			currBondCount = 0;
			
		}
		
		public function isAvalibleBonds():Boolean{
			if(currBondCount<=bondCount){
				return true;
			}
			else{
				return false;
			}
		}
		

		}
	
}