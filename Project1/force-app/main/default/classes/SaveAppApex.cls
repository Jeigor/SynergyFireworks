public class SaveAppApex {

    @AuraEnabled
    public static Applicant__c SaveApplication(Applicant__c App){
        upsert App;
        return App;
    }
    
}