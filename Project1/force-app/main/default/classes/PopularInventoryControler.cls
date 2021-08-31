public class PopularInventoryControler {
	
    public List<PopularityObject> invPickList{get;set;} 
    
    public void CreateOrder() {
        // going to make a bunch of supply requests
        List<Supply_Request__c> neededSupplies = new List<Supply_Request__c>();
        Supply_Request__c supplyOrder = new Supply_Request__c();
        
        supplyOrder.IsCompleted__c = false;        
		// we need to know which items and how much        
        for (PopularityObject item: invPickList){
            if(item.RecAmt>0) {
		        supplyOrder.SupplyRequest__c = item.Name;
            }
        }
        insert neededSupplies;
    }

    //Initializing
    public PopularInventoryControler()
    {
        // inventory Matrix
        invPickList = new List<PopularityObject>();
       
	    // finding the picklist values and fill invPickList with their strings
        Schema.DescribeFieldResult fieldResult = Inventory__c.Inventory_Unit__c.getDescribe();
        list<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry plv: ple) {
            // filling top row with default picklist
            PopularityObject nextItem = new PopularityObject();
            nextItem.customInit();
            nextItem.Name = plv.getLabel();
            invPickList.add(nextItem);
        }      

        // update inventory in the Popularity objects
        List<Inventory__c> InventoryList =[Select Inventory_Unit__c, Inventory_Amount__c From Inventory__c];
        for(Inventory__c inv:InventoryList){
            for(PopularityObject i:invPickList){
                if (inv.Inventory_Unit__c == i.Name) {
                    i.InvAmt = inv.Inventory_Amount__c;
					break;                    
                }
            }
        }
        
        // count orders and record in the Popularity objects
        List<Transaction__c> transactionList =[Select Bread_Type__c, Drink__c, Meat_Type__c From Transaction__c];
        for(Transaction__c t:transactionList){
            for(PopularityObject i:invPickList){
                if (t.Bread_Type__c == i.Name || t.Drink__c == i.Name || t.Meat_Type__c == i.Name) {
                    i.SoldAmt++;
                    i.UpdateRecAmt();                    
                    break;                    
                }
            }
        }

    }
    
    

    
}