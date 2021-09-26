({
    
     resetForm: function(component){
        let clearFormAction = component.get("c.getNewItem");
            console.log("resetForm funtcion in form helper")
          	clearFormAction.setCallback(this, function(response){
            	let state = response.getState();
            	if (state === "SUCCESS") {
                	//let items = component.get("v.items");
                	//theItems.push(response.getReturnValue());
                	//component.set("v.items", theItems);
                    
                   //let newBlankItem = JSON.parse("{\'sobjectType\': \'Camping_Item__c\', \'Name\': \'\',\'Quantity__c\': 0,\'Price__c\': 0,\'Packed__c\': false }");
            		//let theNewItem = component.get("v.newItem");
            		//theNewItem.push(newBlankItem);
            		component.set("v.newItem",response.getReturnValue());
                    let weekdays = "Monday;Tuesday;Wednesday;Thursday;Friday;Saturday;Sunday";
                    component.set("v.newItem.Duty_Days__c", weekdays);
                   	//console.log(weekdays.replaceAll(';',','));
                   // let checkboxGroup = component.find("listviewselectcheckboxgroupweekdays");
                   // checkboxGroup.set("v.value", weekdays.replace(';',','))
                   let weekdaysList=weekdays.split(';');
                    console.log(weekdaysList);
                    
                   // let weekdaysObject = {}
                   // for(var i=0; i<weekdaysList.length; i++){
                   //     weekdaysObject[i]=weekdaysList[i];
                   // }
            		component.set("v.checkboxgroupvalueweekdays", weekdaysList);
                    component.set("v.newItem.Active__c", true);
                    console.log(component.get("v.checkboxgroupvalueweekdays"));
            	}
                else {
                	console.log("Failed with state: " + state);
           		}
       		 });
        	$A.enqueueAction(clearFormAction);
           
         
        
    },
	    createItem : function(component, newItem){
  
     		let addItemEvent = component.getEvent("addItem");
        	addItemEvent.setParams({ "item": newItem });
        	addItemEvent.fire();
            
            this.resetForm(component);
            /*
            let weekdays = "Monday;Tuesday;Wednesday;Thursday;Friday;Saturday;Sunday";
            
            let newBlankItem = "{ 'sobjectType': 'Shop_Duty__c', 'Name': '','Description__c':'','Active__c': true, 'Duty_Days__c':'"+weekdays+"'}";
            		//let theNewItem = component.get("v.newItem");
            		//theNewItem.push(newBlankItem);
            component.set("v.newItem",newBlankItem);
          
                    //component.set("v.newItem.Duty_Days__c", weekdays);
                   	//console.log(weekdays.replaceAll(';',','));
                   // let checkboxGroup = component.find("listviewselectcheckboxgroupweekdays");
                   // checkboxGroup.set("v.value", weekdays.replace(';',','))
                   let weekdaysList=weekdays.split(';');
                    console.log(weekdaysList)
                   // let weekdaysObject = {}
                   // for(var i=0; i<weekdaysList.length; i++){
                   //     weekdaysObject[i]=weekdaysList[i];
                   // }
            		component.set("v.checkboxgroupvalueweekdays", weekdaysList);
                    console.log(component.get("v.checkboxgroupvalueweekdays"));
         	*/
        
	}
    
   
})