@isTest
public class TaskExtensionControllerTest {
    
    @isTest static void testUserTaskToInsert(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Recruiter'];
        User u2 = new User(Alias = 'newUser', Email='someuser@testorg.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                           LocaleSidKey='en_US', ProfileId = p.Id,
                           TimeZoneSidKey='America/Los_Angeles', UserName='Some@testorg.com');
        
        TaskExtensionController classToTest = new TaskExtensionController();
        classToTest.taskToInsert = new Task(Status='Not Started', Priority='Normal');
        Test.startTest();
        System.runAs(u2){
            pageReference pg = classToTest.addNewTask();
        }
        Test.stopTest();
    }
    
    
}