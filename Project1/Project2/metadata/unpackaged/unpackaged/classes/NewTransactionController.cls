public class NewTransactionController {
	    @AuraEnabled
    public static List<Transaction__c> getTrans() {
        // Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[] {
            'Id', 'Name', 'Bread_Type__c', 'Meat_Type__c', 'Drink__c', 'Drink_Included__c', 'Utensils_Included__c'
        };
        Map<String,Schema.SObjectField> fieldDescribeTokens =
            Schema.SObjectType.Transaction__c.fields.getMap();
        for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
        // OK, they're cool, let 'em through
        return [SELECT Id, Name, Bread_Type__c, Meat_Type__c, Drink__c, Drink_Included__c, Utensils_Included__c FROM Transaction__c];
    }
    @AuraEnabled
    public static Transaction__c saveTran(Transaction__c trans) {
        // Perform isUpdateable() checking first, then
        upsert trans;
        return trans;
    }
}