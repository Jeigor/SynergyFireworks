public with sharing class  LoginController {
    @AuraEnabled
    public static String getDetails(String username, String password)
    { 
        List<Contact> con_List=[Select Id,Username__c,Password__c from Contact where Username__c =: username Limit 1];
        if(con_List.size() == 0)
        {
           return 'User does not exist'; 
        }
        else
        {
            if(con_List[0].Password__c==password)
            {
                return 'Login successfull!!!!';
            }
            else
            {
                return 'Invalid password please try again!!!!';
            }
        }
    }
}