({
     doInit: function(component, event, helper) {
		console.log('doinit fired in shopduties list')
	        // Create the action
       helper.resetForm(component);
    },
	   clickCreateItem : function(component, event, helper){
         let validItem = component.find('shopdutyform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new camping item
            let newItem = component.get("v.newItem");
            console.log(newItem)
     		helper.createItem(component, newItem);
        }
	},
    handleListViewCheckboxGroupWeekdaysChange: function(component, event, helper){
        
        let weekdayCheckboxGroup = component.get('v.checkboxgroupvalueweekdays');
        let dutyDaysString = "";
        
        weekdayCheckboxGroup.forEach(weekdayCheckboxGroup => {
			console.log(weekdayCheckboxGroup);
            dutyDaysString += weekdayCheckboxGroup + ";";
		});
        
        
        if(dutyDaysString.length>0){
            dutyDaysString = dutyDaysString.slice(0,-1);
            component.set("v.newItem.Duty_Days__c", dutyDaysString);
            console.log("duty days are :" +component.get("v.newItem.Duty_Days__c"))
        }
            else{
            component.set("v.newItem.Duty_Days__c", '');
        }
        
       
        
    },
          
            handleResetForm:function(component, event, helper){
            	console.log("handlereset for fired");
            	helper.resetForm(component);
            
            }
   

})