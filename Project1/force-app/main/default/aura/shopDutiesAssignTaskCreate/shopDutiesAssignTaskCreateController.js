({
    
    doInit: function(component, event,helper){
        let currentDate = new Date();
		let cDay = currentDate.getDate();
		let cMonth = currentDate.getMonth() + 1;
		let cYear = currentDate.getFullYear();
        if(cMonth<10) 
		{
    		cMonth='0'+cMonth;
		} 
        let dateString = cYear+'-'+cMonth+'-'+cDay
        component.set('v.objTask.ActivityDate', dateString);
        var shpDutyObj = component.get("v.objShop_Duty__c");
        component.set('v.objTask.Subject', 'Shop Duty: '+shpDutyObj.Name);
       //	console.log(dateString);
    },
    
	saveTaskRecord : function(component, event, helper) {
        
        console.log('saveTaskRecord fired');
       
        //component.set('v.objTask.Description',shpDutyObj.Name);
        //component.set('v.objTask.Subject','Shop Duty');
        //component.set('v.objTask.Subject', 'Shop Duty: '+shpDutyObj.Name);
        var tskObj = component.get("v.objTask");
        
        var employeeListObj = component.get("v.employeeRecords");
        //console.log(employeeListObj);
        //console.log(tskObj.ActivityDate);
       var subjField = component.get('v.objTask.Subject');
       
       
       if(employeeListObj.length && subjField.length){
        
       //call apex class method
      var action = component.get('c.saveTask');
        action.setParams({
            'tsk': tskObj,
            'empSObjLst':employeeListObj
        })
      action.setCallback(this, function(response) {
        //store state of response
        console.log(response.getState());
        var state = response.getState();
        var toastEvent = $A.get("e.force:showToast");  
        toastEvent.setParams({
              "title": "Success!",
             "message": "The Tasks were added Successfully."
         });
        if (state === "SUCCESS") {
            console.log('record Created');
          	 toastEvent.fire();
            helper.closeModal(component, 'Tasks Successfully Assigned!');
         	//console.log(response.getResultsValue());
        }
        else {
              
              console.log("Error occured:"+response.error[0].message);
        }
      });
        console.log('before enqueue action')
      $A.enqueueAction(action);
        }
        else{
            if(!subjField.length){
            	component.set('v.missingSubjectError', "Please enter a subject before saving.");
            }
            component.set('v.missingEmployeeError', "Need to select at least one person to assign the task.")
        }
       
	},
    handleSubjectChange : function(component, event, helper) {
        var subjField = component.get('v.objTask.Subject');
        var misSubError = component.get('v.missingSubjectError');
        if(subjField.length && missSubError.length){
        	component.set('v.missingSubjectError', "");
        }
    },
     handleComponentEvent : function(component, event, helper) {
    // get the selected Account record from the COMPONETN event 
    	console.log("handle component event in shopdututies assingtaskcreate controller")	 
       var selectedEmployeeGetFromEvent = event.getParam("recordByEvent");
	   //component.set("v.selectedRecord" , selectedAccountGetFromEvent); 
       //var employeeRecList = component.get('v.employeeRecords');
        //employeeRecList.push(selectedEmployeeGetFromEvent);
       // component.set("v.employeeRecords", employeeRecList);
       component.set('v.missingEmployeeError', "")
      
	},
    /*
    changeDate:function(component, event, helper){
        var tskObj = component.get("v.objTask");
        console.log(tskObj.ActivityDate)
    }*/
})