trigger SupplyRequestTrigger on Supply_Request__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType {
        when BEFORE_INSERT { 
            
        }
        when BEFORE_UPDATE {
            //SupplyRequestHandler.SupplyInventoryUpdate(trigger.new, trigger.oldmap);
        }
        when BEFORE_DELETE {
            //SupplyRequestHandler.DeletionCheck(trigger.old);
        }
        when AFTER_INSERT {
            //SupplyRequestHandler.SupplyInventoryInsertCheck(trigger.new);
        }
        when AFTER_UPDATE {
            
        }
        when AFTER_DELETE { 
            
        }
        when AFTER_UNDELETE { 
            
        }
    }
    
}