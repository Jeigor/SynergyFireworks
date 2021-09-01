public with sharing class TaskExtensionController {
    
    public List<Task> tasList{get{
        if(tasList==null){
            List<task> tass = [SELECT OwnerId, Subject, ActivityDate, Priority, Status FROM Task WHERE NOT Status  Like '%Complete%' Order by ActivityDate];
            SObjectAccessDecision dec = Security.stripInaccessible(AccessType.READABLE, tass);
            this.tasList = dec.getRecords();}   
        return this.tasList;}set;}
    public Task taskToInsert {get; set;}
    public String access {get;set;}
    
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
        insert taskToInsert;
        taskToInsert = null;
        taskToInsert = new Task();
        return null;
    }
    public PageReference updateExistingTask(){
        update tasList;
       	this.tasList = null;
        /*for(Integer i =0; i<tasList.size();i++){
            if(tasList[i].status=='Complete'||tasList[i].status=='Incomplete'){
                tasList.remove(i);
            }
        }*/
        return null;
    }
    public PageReference refreshPage(){
        return null;
    }
}