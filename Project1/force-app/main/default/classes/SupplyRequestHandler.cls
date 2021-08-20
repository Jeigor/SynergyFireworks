public class SupplyRequestHandler {
	public static void SupplyInventoryInsertCheck(List<Supply_Request__c> currentSupply){
        //creeate count variables to keep track of how many requests for each item
        integer baguetteCount = 0;
        integer briocheCount = 0;
        integer ryeCount = 0;
        integer sourdoughCount = 0;
        integer steakCount = 0;
        integer beefCount = 0;
        integer turkeyCount = 0;
        integer hamCount = 0;
        integer waterCount = 0;
        integer cokeCount = 0;
        integer cupCount = 0;
        integer plateCount = 0;
        integer bleachCount = 0;
        integer windexCount = 0;
        integer oxycleanCount = 0;
        integer utensilCount = 0;
        integer totalCount = 0;
        List<Inventory__c> affectedInventory = new List<Inventory__c>();
        for(Supply_Request__c curSupply:currentSupply){
            if(curSupply.IsCompleted__c){//make sure the request is completed before adding to the counter 
                switch on curSupply.SupplyRequest__c{
                    when 'Bread'{//when a bread request is made
                        for(String a:curSupply.Supply_amount__c.split(';')){//splits the picklist intro a list of strings that can be iterated through
                            switch on a{
                                when 'Baguette'{
                                    baguetteCount++;                    
                                }                    
                                when 'Brioche'{
                                    briocheCount++;
                                }            	
                                when 'Rye'{
                                    ryeCount++;
                                }
                                when 'Sourdough'{
                                    sourdoughCount++;
                                }
                            }
                        }
                    }
                    when 'Meat'{//when a meat request is made
                        for(String a:curSupply.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Steak'{
                                    steakCount++;
                                }                    
                                when 'Beef'{
                                    beefCount++;
                                }
                                when 'Turkey'{
                                    turkeyCount++;
                                }
                                when 'Ham'{
                                    hamCount++;                    
                                }
                            }                            
                        }
                        
                    }
                    when 'Drinks'{
                        for(String a:curSupply.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Coke Products'{
                                    cokeCount++;
                                }
                                when 'Water'{
                                    waterCount++;
                                }
                            }                            
                        }
                        
                    }
                    when 'Utensils'{
                        for(String a:curSupply.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Cups'{
                                    cupCount++;
                                }
                                when 'Plates'{
                                    plateCount++;
                                }
                                when 'Knifes/Forks/Spoons'{
                                    utensilCount++;
                                }
                            }
                        }
                        
                    }
                    when 'Cleaning Supplies'{
                        for(String a:curSupply.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Bleach'{
                                    bleachCount++;
                                }
                                when 'Oxyclean'{
                                    oxycleanCount++;
                                }
                                when 'Windex'{
                                    windexCount++;
                                }
                            }
                        }
                    }
                }
            }
        }
        totalCount = baguetteCount + briocheCount + ryeCount + sourdoughCount +steakCount + beefCount + turkeyCount + hamCount + waterCount + cokeCount + cupCount + plateCount+
            utensilCount + oxycleanCount + windexCount +bleachCount;
        if(totalCount > 0){
            affectedInventory = [SELECT Name,Inventory_Unit__c, Inventory_Amount__c FROM Inventory__c];//grabs the inventory records so that they can be added to and then updated
            for(Inventory__c a:affectedInventory){
                switch on a.Inventory_Unit__c {
                    when 'Baguette Bread'{
                        a.Inventory_Amount__c += baguetteCount*50;
                    }
                    when 'Rye Bread'{
                        a.Inventory_Amount__c += ryeCount*50;
                    }
                    when 'Sourdough Bread'{
                        a.Inventory_Amount__c += sourdoughCount*50;
                    }
                    when 'Brioche Bread'{
                        a.Inventory_Amount__c += briocheCount*50;
                    }
                    when 'Steak'{
                        a.Inventory_Amount__c += steakCount*50;
                    }
                    when 'Beef'{
                        a.Inventory_Amount__c += beefCount*50;
                    }
                    when 'Turkey'{
                        a.Inventory_Amount__c += turkeyCount*50;
                    }
                    when 'Ham'{
                        a.Inventory_Amount__c += HamCount*50;
                    }
                    when 'Water'{
                        a.Inventory_Amount__c += waterCount*50;
                    }
                    when 'Coke Product'{
                        a.Inventory_Amount__c += cokeCount*50;
                    }
                    when 'Cups'{
                        a.Inventory_Amount__c += cupCount*50;
                    }
                    when 'Plates'{
                        a.Inventory_Amount__c += plateCount*50;
                    }
                    when 'Eating Utensils'{
                        a.Inventory_Amount__c += utensilCount*50;
                    }
                    when 'Oxyclean'{
                        a.Inventory_Amount__c += oxycleanCount*50;
                    }
                    when 'Bleach'{
                        a.Inventory_Amount__c += bleachCount*50;
                    }
                    when 'Windex'{
                        a.Inventory_Amount__c += WindexCount*50;
                    }
                }
            }
            update affectedInventory;
        }
    }
    
    public static void SupplyInventoryUpdate(List<Supply_Request__c> newList, Map<id,Supply_Request__c> oldMap){
        integer baguetteCount = 0;
        integer briocheCount = 0;
        integer ryeCount = 0;
        integer sourdoughCount = 0;
        integer steakCount = 0;
        integer beefCount = 0;
        integer turkeyCount = 0;
        integer hamCount = 0;
        integer waterCount = 0;
        integer cokeCount = 0;
        integer cupCount = 0;
        integer plateCount = 0;
        integer bleachCount = 0;
        integer windexCount = 0;
        integer oxycleanCount = 0;
        integer utensilCount = 0;
        integer totalCount = 0;
        List<Inventory__c> affectedInventory = new List<Inventory__c>();
        for(Supply_Request__c updateSR: newList){
            if(oldMap.get(updateSR.Id).isCompleted__c==True && (updateSR.IsCompleted__c != oldMap.get(updateSR.Id).isCompleted__c || updateSR.Supply_Amount__c != oldMap.get(updateSR.Id).Supply_Amount__c)){
                updateSR.addError('Sorry, this supply request has been completed and cannot be updated to its uncompleted states or changed to add any other supplies');
            }
            else if(updateSR.IsCompleted__c==True && updateSR.IsCompleted__c != oldMap.get(updateSR.Id).isCompleted__c){
                switch on updateSR.SupplyRequest__c{
                    when 'Bread'{//when a bread request is made
                        for(String a:updateSR.Supply_amount__c.split(';')){//splits the picklist intro a list of strings that can be iterated through
                            switch on a{
                                when 'Baguette'{
                                    baguetteCount++;                    
                                }                    
                                when 'Brioche'{
                                    briocheCount++;
                                }            	
                                when 'Rye'{
                                    ryeCount++;
                                }
                                when 'Sourdough'{
                                    sourdoughCount++;
                                }
                            }
                        }
                    }
                    when 'Meat'{//when a meat request is made
                        for(String a:updateSR.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Steak'{
                                    steakCount++;
                                }                    
                                when 'Beef'{
                                    beefCount++;
                                }
                                when 'Turkey'{
                                    turkeyCount++;
                                }
                                when 'Ham'{
                                    hamCount++;                    
                                }
                            }                            
                        }
                        
                    }
                    when 'Drinks'{
                        for(String a:updateSR.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Coke Products'{
                                    cokeCount++;
                                }
                                when 'Water'{
                                    waterCount++;
                                }
                            }                            
                        }
                        
                    }
                    when 'Utensils'{
                        for(String a:updateSR.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Cups'{
                                    cupCount++;
                                }
                                when 'Plates'{
                                    plateCount++;
                                }
                                when 'Knifes/Forks/Spoons'{
                                    utensilCount++;
                                }
                            }
                        }
                        
                    }
                    when 'Cleaning Supplies'{
                        for(String a:updateSR.Supply_amount__c.split(';')){
                            switch on a{
                                when 'Bleach'{
                                    bleachCount++;
                                }
                                when 'Oxyclean'{
                                    oxycleanCount++;
                                }
                                when 'Windex'{
                                    windexCount++;
                                }
                            }
                        }
                    }
                }
            }
            totalCount = baguetteCount + briocheCount + ryeCount + sourdoughCount +steakCount + beefCount + turkeyCount + hamCount + waterCount + cokeCount + cupCount + plateCount+
                utensilCount + oxycleanCount + windexCount +bleachCount;
            if(totalCount > 0){
                affectedInventory = [SELECT Name,Inventory_Unit__c, Inventory_Amount__c FROM Inventory__c];//grabs the inventory records so that they can be added to and then updated
            for(Inventory__c a:affectedInventory){
                switch on a.Inventory_Unit__c {
                    when 'Baguette Bread'{
                        a.Inventory_Amount__c += baguetteCount*50;
                    }
                    when 'Rye Bread'{
                        a.Inventory_Amount__c += ryeCount*50;
                    }
                    when 'Sourdough Bread'{
                        a.Inventory_Amount__c += sourdoughCount*50;
                    }
                    when 'Brioche Bread'{
                        a.Inventory_Amount__c += briocheCount*50;
                    }
                    when 'Steak'{
                        a.Inventory_Amount__c += steakCount*50;
                    }
                    when 'Beef'{
                        a.Inventory_Amount__c += beefCount*50;
                    }
                    when 'Turkey'{
                        a.Inventory_Amount__c += turkeyCount*50;
                    }
                    when 'Ham'{
                        a.Inventory_Amount__c += HamCount*50;
                    }
                    when 'Water'{
                        a.Inventory_Amount__c += waterCount*50;
                    }
                    when 'Coke Product'{
                        a.Inventory_Amount__c += cokeCount*50;
                    }
                    when 'Cups'{
                        a.Inventory_Amount__c += cupCount*50;
                    }
                    when 'Plates'{
                        a.Inventory_Amount__c += plateCount*50;
                    }
                    when 'Eating Utensils'{
                        a.Inventory_Amount__c += utensilCount*50;
                    }
                    when 'Oxyclean'{
                        a.Inventory_Amount__c += oxycleanCount*50;
                    }
                    when 'Bleach'{
                        a.Inventory_Amount__c += bleachCount*50;
                    }
                    when 'Windex'{
                        a.Inventory_Amount__c += WindexCount*50;
                    }
                }
            }
            update affectedInventory;
            }
            
        }
    }
	public static void DeletionCheck(List<Supply_Request__c> dataToBeDeleted){
        for(Supply_Request__c ord: dataToBeDeleted){
                if(ord.IsCompleted__C){//checks to see if order has been fulfilled
                    ord.addError('Cannot be deleted because order has been fulfilled');
                }
            }
        
    }
}