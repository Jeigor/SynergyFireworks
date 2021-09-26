public class CreateContactApex {

    @AuraEnabled
    public static Contact SaveContact(Contact SaveCon){
        insert SaveCon;
        return SaveCon;
    }
}