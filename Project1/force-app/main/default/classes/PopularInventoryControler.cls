public class PopularInventoryControler {
	
    public List<PopularityObject> invPickList{get;set;} 
    
    public void CreateOrder() {
        // going to make a bunch of supply requests
        List<Supply_Request__c> neededSupplies = new List<Supply_Request__c>();
        
        
		// we need to know which items and how much        
        for (PopularityObject item: invPickList){
            if(item.RecAmt>0) {
                // found a needed Item
                /*//best solution
                Supply_Request__c supplyOrder = new Supply_Request__c();
                supplyOrder.IsCompleted__c = false;        
		        supplyOrder.SupplyRequest__c = item.Name;
                neededSupplies.add(supplyOrder);
                */
                
                //solution if Supply_Request__c format does not change
                    Supply_Request__c supplyOrder = new Supply_Request__c();
                    supplyOrder.IsCompleted__c = false;        
                    switch on string.valueOf(item.Name){
                        // there are two different 'bread' sections because of the inconsistant naming conventions. 
                        // this first 'when' removes 'bread' from the name so that the Supply Request object will accept item.name 
                        // the second 'when' only gets triggered if the item.name has already been through the first 'when'
                        // a way to make this ugly hard coded code better would be to have a way of catigorizing the 
                        // objects within the org OR changing the supply order object to not worry about the catigorization.
                        // also something the supplyorder object could really use is an integer field for requesting more 
                        // than one of a kind of item
                        when 'Baguette Bread','Brioche Bread','Rye Bread','Sourdough Bread'{ 
                            supplyOrder.SupplyRequest__c = 'Bread';
                            item.Name = item.Name.Left(item.name.indexof(' '));
                        }
                        when 'Baguette','Brioche','Rye','Sourdough'{
                            supplyOrder.SupplyRequest__c = 'Bread';
                        }
                        when 'Beef','Steak','Turkey','Ham' {
                            supplyOrder.SupplyRequest__c = 'Meat';                            
                        }
                        when 'Coke Products','Water'{
                            supplyOrder.SupplyRequest__c = 'Drinks';                            
                        }
                    }
                    supplyOrder.Supply_amount__c = item.Name;
                    system.debug('adding order:');
                    system.debug(supplyOrder);
                    neededSupplies.add(supplyOrder);

            }
        }
        // Inserting Supplies
        insert neededSupplies;
        // I wanted to display a success message to the user with this function. It doesn't break the website, but nothing happens either.
//        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Supply Requests Placed')); 
    }

    //Initializing
    public PopularInventoryControler() {
        // inventory Matrix
        invPickList = new List<PopularityObject>();
       
	    // finding the picklist values and fill invPickList with their strings
        Schema.DescribeFieldResult fieldResult = Inventory__c.Inventory_Unit__c.getDescribe();
        list<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        // filling top row with default picklist
        for(Schema.PicklistEntry plv: ple) {    
            PopularityObject nextItem = new PopularityObject();
            nextItem.customInit();
            nextItem.Name = plv.getLabel();
            // we only want food
            switch on nextItem.Name{
                when 'Plates','Cups','Eating Utensils','Bleach','Windex','Oxyclean','Pending Inventory Unit' {
                    continue;
                }
                when else {
		            invPickList.add(nextItem);                    
                }
            }
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
                if(i.Name != Null && t.Bread_Type__c !=NULL && i.Name.contains(t.Bread_Type__c)) {
                    i.SoldAmt++;
                    i.UpdateRecAmt();
                    break;
                }
                if(i.Name != Null && t.Drink__c !=NULL && i.Name.contains(t.Drink__c)) {
                    i.SoldAmt++;
                    i.UpdateRecAmt();
                    break;
                }
                if(i.Name != Null && t.Meat_Type__c !=NULL && i.Name.contains(t.Meat_Type__c)) {
                    i.SoldAmt++;
                    i.UpdateRecAmt();
                    break;
                }
            }
        }

    }
    
    

    
}