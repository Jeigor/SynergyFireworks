public class TransactionController {
    
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
 
        
    }
    //checkout action
    public PageReference OrderNow() {
        
        insert Tranlist;
        
        return Page.ThankYouForOrdering;
        
        
    }
   

}