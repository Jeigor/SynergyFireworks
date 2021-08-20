@isTest private class TransactionTriggerTest {
    @isTest static void testTransactionInsert(){
        Transaction__C a = new Transaction__c(Bread_Type__c = 'Baguette', Meat_Type__c = 'Beef');
    }
}