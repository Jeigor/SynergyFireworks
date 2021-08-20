public class TransactionHandler {
    public static void ValidateTransaction(List<Transaction__c> currentTransactions){
        for(Transaction__c currTransaction:currentTransactions){
            if((!String.isBlank(currTransaction.Meat_Type__c)&&String.isBlank(currTransaction.Bread_Type__c))||(String.isBlank(currTransaction.Meat_Type__c)&&!String.isBlank(currTransaction.Bread_Type__c))){
                currTransaction.addError('The transaction must have both Meat and Bread in order to be completed');
            }
            else if((String.isBlank(currTransaction.Meat_Type__c)&&String.isBlank(currTransaction.Bread_Type__c))&&!currTransaction.Drink_Included__c){
                currTransaction.addError('The transaction must have either a sandwich or a selected drink to be included');
            }            
        }
    }
    public static void afterInsertInventory(List<Transaction__c> currentTransactions){
        List<Inventory__c> affectedInventory = new List<Inventory__c>();
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
        integer utensilCount = 0;
        for(Transaction__c currTransaction:currentTransactions){
            switch on currTransaction.Bread_Type__c{//for determining bread 
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
            switch on currTransaction.Meat_Type__c{
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
            
            if(currTransaction.Utensils_Included__c){
                utensilCount++;
            }
            if(currTransaction.Drink_Included__c){
                if(currTransaction.Drink__c=='Water'){
                    waterCount++;
                }
                if(currTransaction.Drink__c=='Coke Product'){
                    cokeCount++;
                }
            }
        }
        affectedInventory = [SELECT Name,Inventory_Unit__c, Inventory_Amount__c FROM Inventory__c WHERE Inventory_Unit__C != 'Oxyclean'  OR Inventory_Unit__C !='Bleach' OR Inventory_Unit__C !='Windex'];
        for(Inventory__c a:affectedInventory){
            switch on a.Inventory_Unit__c {
                when 'Baguette Bread'{
                    a.Inventory_Amount__c -= baguetteCount;
                }
                when 'Rye Bread'{
                    a.Inventory_Amount__c -= ryeCount;
                }
                when 'Sourdough Bread'{
                    a.Inventory_Amount__c -= sourdoughCount;
                }
                when 'Brioche Bread'{
                    a.Inventory_Amount__c -= briocheCount;
                }
                when 'Steak'{
                    a.Inventory_Amount__c -= steakCount;
                }
                when 'Beef'{
                    a.Inventory_Amount__c -= beefCount;
                }
                when 'Turkey'{
                    a.Inventory_Amount__c -= turkeyCount;
                }
                when 'Ham'{
                    a.Inventory_Amount__c -= HamCount;
                }
                when 'Water'{
                    a.Inventory_Amount__c -= waterCount;
                }
                when 'Coke Product'{
                    a.Inventory_Amount__c -= cokeCount;
                }
                when 'Cups'{
                    a.Inventory_Amount__c -= waterCount+cokeCount;
                }
                when 'Plates'{
                    a.Inventory_Amount__c -= baguetteCount + ryeCount + sourdoughCount + briocheCount;
                }
                when 'Eating Utensils'{
                    a.Inventory_Amount__c -= utensilCount;
                }
            }
        }
        update affectedInventory;
        
    }
}