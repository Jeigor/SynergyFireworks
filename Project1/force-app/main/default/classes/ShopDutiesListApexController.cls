public class ShopDutiesListApexController {

    @AuraEnabled
    public static List<Shop_Duty__c> getItems() {
        return [SELECT Id, Name,  Description__c,  Active__c, Duty_Days__c
                FROM Shop_Duty__c];
    }
    
    @AuraEnabled
    public static Shop_Duty__c saveItem(Shop_Duty__c item) {
        // Perform isUpdateable() checking first, then
        System.debug(item);
        upsert item;
        return item;
    }
    
    @AuraEnabled
    public static Shop_Duty__c getNewItem(){
        return new Shop_Duty__c();
        
    }
}