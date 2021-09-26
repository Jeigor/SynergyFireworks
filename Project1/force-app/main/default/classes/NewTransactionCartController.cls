public class NewTransactionCartController {
    @AuraEnabled
    public static transaction__c saveTran(Transaction__c trans) {
        // Perform isUpdateable() checking first, then
        upsert trans;
        return trans;
    }
}