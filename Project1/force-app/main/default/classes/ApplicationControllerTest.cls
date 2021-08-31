@istest
public class ApplicationControllerTest {
	@istest
    static void verifyAndSaveTest() {
        
        Applicant__c appl = new Applicant__c(contact_email__c='capamerica@cap.am');
        
        Applicant__c app = new Applicant__c(contact_email__c='capamerica@cap.am');  
        
        test.startTest();
        insert appl;
        PageReference pageRef = Page.ApplicationPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', String.valueOf(app.Id));
        ApplicationControllerExtension controller = new ApplicationControllerExtension();
        try{controller.verifyAndSave();}
        catch(exception e){
            system.assert(e.getMessage().contains('Email already connected to an application'));
        }
        test.stopTest();
    }
    @istest
    static void verifyAndSaveTimeTest() {
        Applicant__c app2 = new Applicant__c(sunday_start__c = time.newInstance(4, 0, 0, 0));
        test.startTest();
        PageReference pageRef = Page.ApplicationPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', String.valueOf(app2.Id));
        ApplicationControllerExtension controller = new ApplicationControllerExtension();
        try{controller.verifyAndSave();}
        catch(exception e) {
            system.assert(e.getMessage().contains('Start time cannot be before Opening Hours(10AM)'));
        }
    }
}