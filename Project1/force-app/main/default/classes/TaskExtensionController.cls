public with sharing class TaskExtensionController {
    
    public List<Task> tasList{get{
        if(tasList==null){
            //first only returns a list of tasts that is not complete or incomplete
            List<task> tass = [SELECT OwnerId, Subject, ActivityDate, Priority, Status FROM Task WHERE NOT Status  Like '%Complete%' Order by ActivityDate];
            //uses security to strip all the records that would be inaccessable to the user
            SObjectAccessDecision dec = Security.stripInaccessible(AccessType.READABLE, tass);
            //sets the tasList to be the records that the user would have access to 
            this.tasList = dec.getRecords();}
        return this.tasList;}set;}
    public Task taskToInsert {get; set;}
    
    public TaskExtensionController(){
        taskToInsert = new Task();
    }
    
    /*public List<Task> getTasList(){
        if(this.tasList==null){
            List<task> tass = [SELECT OwnerId, Subject, ActivityDate, Priority, Status FROM Task WHERE NOT Status  Like '%Complete%' Order by ActivityDate];
            SObjectAccessDecision dec = Security.stripInaccessible(AccessType.READABLE, tass);
            this.tasList = dec.getRecords();
        }
        return this.tasList;
    }*/
    
    public PageReference addNewTask(){
        //enforces security on the task creation so that the is actually able to insert a task before inserting into the database
        if(Schema.SObjectType.Task.isCreateable()){
            insert taskToInsert;
            taskToInsert = null;
            taskToInsert = new Task();
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'You do not have access to insert a task'));
        }
        
        return null;
    }
    public PageReference updateExistingTask(){
        update tasList;
       	this.tasList = null;
        return null;
    }

}