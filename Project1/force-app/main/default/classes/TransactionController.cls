public class TransactionController {
    
    //make getter and setter
    
    public Transaction__c tran {get; set;}
    
    public list<Transaction__c> Tranlist {get;set;}
    
     //constructor
    public TransactionController() {
       
    tran = new Transaction__c();
    Tranlist = new list<Transaction__c>();
 
}
    //add to cart action
    public void addCart() {

        Tranlist.add(tran);
        tran = null;
        tran = new Transaction__c();
        
        /* If you want this to work with Validation or inventory out of stock... you need to wrap this in a Try... catch throw custom exception block... 
        
        below is how you would test for it
        
        catch(Exception xox) {

            System.assert(xox.getMessage().contains('Can not delete record because there is payment'));
        }
        
        */
    
 
        
    }
    //checkout action
    public PageReference OrderNow() {
        
        insert Tranlist;
        
        //redirect to Thank you page
        
        return Page.ThankYouForOrdering;
        
        
    }
    
    //need button to go back to home back for future group to implement.  Use above methods :)  
   

}
