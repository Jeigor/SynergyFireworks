public class CustomLookUpController {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, List <sObject> alreadySelected) {
       // system.debug('ObjectName-->' + ObjectName);
                
        //use escapeSingleQuotes to prevent SQLInject
        String searchKey = String.escapeSingleQuotes(searchKeyWord) + '%';
        
        List < sObject > returnList = new List < sObject > ();
       	String sQuery =  'SELECT Id, Name, Full_Name__c, User__c FROM Employee__c';
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 10   
        if (searchKeyWord != '' ){
            sQuery += ' where Full_Name__c LIKE: searchKey ';
        }
        if(alreadySelected !=null && alreadySelected.size()>0){
           set<Id> excludeSet=new set<Id>() ;
        	for (sObject sObj : alreadySelected){
            	Employee__c myEmp = (Employee__c) sObj;
            	excludeSet.add(myEmp.Id);
        	}

            sQuery += 'AND Id NOT IN :excludeSet ';
        }
        sQuery +='ORDER BY createdDate DESC limit 10';
        
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}