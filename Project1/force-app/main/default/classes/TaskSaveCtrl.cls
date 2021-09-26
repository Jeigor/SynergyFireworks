public class TaskSaveCtrl {

     @AuraEnabled 
    public static List<Task> saveTask(Task tsk, List<sObject> empSObjLst){
        
        List<Task> tskList = new List<Task>();
        System.debug('test description '+tsk.Description);
        System.debug('test subject '+tsk.Subject);
        //System.debug((Employee__c) empLst[0].User__c);
        
  		//tskList.add(new Task(ActivityDate=tsk.ActivityDate, Description=tsk.Description, Subject=tsk.Subject, OwnerId='0055f000000XQwvAAG'));
     
        for(sObject emp: empSObjLst){
           
			Employee__c myEmp = (Employee__c) emp;
             //Task taskItm = new Task(Description=tsk.Description, ActivityDate=tsk.ActivityDate, Priority=tsk.Priority, Status=tsk.Status, OwnerId=emp.Id);
          tskList.add(new Task(ActivityDate=tsk.ActivityDate, Description=tsk.Description, Subject=tsk.Subject, OwnerId=myEmp.User__c));
           // tskList.add(new Task(ActivityDate=tsk.ActivityDate, Description=tsk.Description, Subject=tsk.Subject,OwnerId='0055f000000XQwvAAG'));
            /*
            Task t = new Task();
			t.OwnerId = emp.Id;
			t.Subject = tsk.Subject;
			t.Status = tsk.Status;
            t.Description=tsk.Description;
			t.Priority =  tsk.Priority;
			tskList.add(t);
		   */
        }
     
       try {
                insert tskList;
                System.debug('able to insert task');
                
            } 
            catch(System.DmlException e){
                System.debug('error occured on task insert dml'+e.getMessage());
            }
        return tskList;
    }   
}