public class PopularityObject {
    public String Name{get;set;}
    public Decimal InvAmt{get;set;}
    public Decimal SoldAmt{get;set;}
    
    //theoretically this member is for grabbing only records within the last NumDays
    //		and then using the NumDays to estimate how many to order
    public Integer NumDays{get;set;}
    
    //recommended amount 
    public Decimal RecAmt{get;set;}
    
    public void PopularityObject(){} 
    
    public void customInit(){
        Name = '';
        InvAmt = 0;
        SoldAmt = 0;
        NumDays = 7;
        UpdateRecAmt();        
    }
    
    public void UpdateRecAmt(){
        RecAmt = 0;
        RecAmt = SoldAmt*NumDays-InvAmt;
        if(RecAmt <0){
            RecAmt = 0;
        }
    }
}