public class ApplicationControllerExtension {
    
    public Applicant__c App{get; set;}
    boolean SameEmail{get; set;}        
        
    public ApplicationControllerExtension(){
        App = new Applicant__c();
    }
    public class ApplicationException extends System.Exception {
        
    }
    //Method to verify that 
    //	a. The email connected to the application isn't already in another application
    //	b. The availability is within the hours the store is open
    //Both will return an exception if not matching the criteria
    public PageReference verifyAndSave() {
        SameEmail = False;
        // getting list of applicants 
        // comparing Email to list of applicants emails for same
        List<Applicant__c> AppList = [SELECT Contact_email__c FROM Applicant__c];
        for(Applicant__c appl : AppList){
            if(appl.Contact_email__c == App.Contact_Email__c) {
                SameEmail = True;
            }
        }
        try{
            if(SameEmail == True){
            	throw new ApplicationException('Email already connected to an application');
        	}
            //Can ALL be handled in a validation rule
            else if(App.Sunday_Start__c < Time.newInstance(10, 0, 0, 0) || App.Monday_Start__c < Time.newInstance(10, 0, 0, 0) || 
                   App.Tuesday_Start__c < Time.newInstance(10, 0, 0, 0) || App.Wednesday_Start__c < Time.newInstance(10, 0, 0, 0) ||
                   App.Thursday_Start__c < Time.newInstance(10, 0, 0, 0) || App.Friday_Start__c < Time.newInstance(10, 0, 0, 0) ||
                   App.Saturday_Start__c < Time.newInstance(10, 0, 0, 0)){
                throw new ApplicationException('Start time cannot be before Opening Hours(10AM)');
            }
            else if(App.Sunday_end__c > Time.newInstance(21, 0, 0, 0) || App.Monday_end__c > Time.newInstance(21, 0, 0, 0) || 
                   App.Tuesday_end__c > Time.newInstance(21, 0, 0, 0) || App.Wednesday_end__c > Time.newInstance(21, 0, 0, 0) ||
                   App.Thursday_end__c > Time.newInstance(21, 0, 0, 0) || App.Friday_end__c > Time.newInstance(21, 0, 0, 0) ||
                   App.Saturday_end__c > Time.newInstance(21, 0, 0, 0)){
                throw new ApplicationException('End time cannot be after 9PM');
            }
            else{
            	insert App;
        	}
        }
        catch(exception e){ApexPages.addMessages(e);}
        
        return null;
    }

}