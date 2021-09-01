@isTest
public class TransactionpageControllerTest {
    
     Transaction__c tran = new Transaction__c();
    
    
    @isTest static void testNewTransaction(){
        
        
    
        Test.StartTest(); 
        
        Transaction__c testtran = new Transaction__c();
        testtran.Bread_Type__c = 'Rye';
        testtran.Meat_Type__c = 'Steak';
        //<list> Transaction__c Tlist = new <list>Transaction__c ();
        
        //insert testtran;
        //
        
        
        PageReference pageRef = Page.NewTransaction; // Add your VF page Name here
  		pageRef.getParameters().put('id', String.valueOf(testTran.Id));
  		Test.setCurrentPage(pageRef);
 
  		TransactionController control = new TransactionController();
        
        String nextPage = control.OrderNow().getUrl();
        
        control.addcart();

        control.OrderNow();
        
        system.assertEquals('/apex/thankyouforordering', nextPage);


 		Test.StopTest();
        
  
        
        
        
    }

}