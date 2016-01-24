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
		public var bonds:ArrayCollection = new ArrayCollection;
		public function get currBondCount():Object {return bonds.length}
		public static var allElements:ArrayCollection = new ArrayCollection;
		
		/** stwórz nowy pierwiastek
		 * @param source źródło obrazka
		 * @param bondCount ilość wiązań
		 */
		public function Element(source:String, name)
		{
			super();
			this.name= name;
			this.bondCount = 10;
			
			this.source=source;
			isSelected=false;
			this.width  = 100;
			this.height = 100;
			allElements.addItem(this);
			
		}
		public function Select():void{
			this.isSelected=true;
			this.alpha = 0.5;
		}
		public function Unselect():void{
			this.isSelected=false;
			this.alpha = 1.0;
		}
		
		public function RemoveElement(){
			this.RemoveAllBonds();
			this.parent.removeChild(this as DisplayObject);
			var i  = allElements.getItemIndex(this);
			allElements.removeItemAt(i);
		}
		
		
		public function AddBond(bond:Bond){
			
			bonds.addItem(bond);
	
		}
		
		public function RemoveBond(bond:Bond){
			var index = bonds.getItemIndex(bond);
				bonds.removeItemAt(index);
		}
		
		public function RemoveAllBonds(){
			var toDel=[];
			for each(var bond in this.bonds){
				toDel.push(bond);
			}
			for each(var bond in toDel){
				bond.RemoveBond();
			}
			bonds = new ArrayCollection;
			
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