({
	 doInitHelper: function(component) {
         let action = component.get("c.getItems");
         console.log('doinithelper fired')
        //action.setParams({'active': true })
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
                
                console.log('success loading records');
                this.filterItemsHelper(component);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    saveItem: function(component, item, callback) {
        let action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    addItem: function(component, item) {
         this.saveItem(component, item, function(response){
            let state = response.getState();
            var toastEvent = $A.get("e.force:showToast");  
    		toastEvent.setParams({
    				"title": "Success!",
    					"message": "The new shop duty has been added successfully."
			});
            if (state === "SUCCESS") {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
                this.filterItemsHelper(component);
                //let clearAddFormEvent = component.getEvent("clearAddForm");
        		//addItemEvent.setParams();
        		//clearAddFormEvent.fire();
        		toastEvent.fire();  
            }
             else{
                 
                 console.log("retrieving shop duties error:");
             }
        });
    },
   
    updateItemListHelper: function (component, message){
        console.log('update item list helper fired');
       	    var toastEvent = $A.get("e.force:showToast");  
    		toastEvent.setParams({
    				"title": "Success!",
    					"message": "The Duty Active Status Was Updated Successfully."
			});
        toastEvent.fire();
        this.doInitHelper(component);
        helper.filterItemsHelper(component);
      
    },
    filterItemsHelper: function (component){
        let items = component.get('v.items');
        let viewActiveCheck = component.get('v.checkboxgroupvalueactive');
        console.log(items);
        let weekdayCheckboxGroup = component.get('v.checkboxgroupvalueweekdays');
        let dutyDaysString = "";
        
        weekdayCheckboxGroup.forEach(weekdayCheckboxGroup => {
			console.log(weekdayCheckboxGroup);
            dutyDaysString += weekdayCheckboxGroup + ";";
		});
        
        var filteredItems = [];
        if(dutyDaysString.length>0){
            dutyDaysString = dutyDaysString.slice(0,-1);
            
            //console.log(e.Duty_Days__c);
            console.log(dutyDaysString);
           
            for(let i = 0; i < items.length; i++)
            {
            	//console.log("test");
            	//console.log("Duty Days __c is")
            	//console.log(items[i]["Duty_Days__c"]);
            	//console.log("dutyDaysString is "+dutyDaysString);
            	//console.log(i);
            	let dutyDaysStringInItems = items[i]["Duty_Days__c"];
            	let activeInItems = items[i]["Active__c"];
            	//console.log("testing string lists");
           	 	//console.log(dutyDaysStringInItems);
            if(typeof dutyDaysStringInItems!=="undefined" && typeof activeInItems !="undefined"){
            	let dutyDaysItems= dutyDaysStringInItems.split(';');
            	let dutyDaysStringList=dutyDaysString.split(";");
            	///console.log("duty days items")
            	//console.log(dutyDaysItems);
            	//console.log("dutyDaysStringList");
            	//console.log(dutyDaysStringList);
            //items[i][Duty_Days__c].forEach((e1)=> dutyDaysString.forEach((e2)=>
            		//{if(e1===e2){
            
           			 //console.log(e1);
            		//console.log(e2);
            		//filteredItems.push(items[i])}}));
            		//
            	for(let p = 0; p < dutyDaysItems.length; p++)
            	{ 
        			if(dutyDaysStringList.indexOf(dutyDaysItems[p])>-1) {
            			//console.log(viewActiveCheck);
            			
            			if(viewActiveCheck.length &&((activeInItems && viewActiveCheck[0]==1) ||(!activeInItems && viewActiveCheck[0]==2))||(viewActiveCheck.length>1)){
            			
            				filteredItems.push(items[i]);
            				//console.log("item in list");
            				break;
            
        				}
            			
            	
        			}
        		}
            	//if(items[i]["Duty_Days__c"]===dutyDaysString) {
            		//filteredItems.push(items[i]);
            		//console.log("items are equal")
            	
        		//}
        	}
        }
            component.set("v.filteredItems", filteredItems);
            //console.log("filtered Items are :" +component.get("v.filteredItems"))
        }
            else{
            component.set("v.filteredItems", items);
        }
        
        
        
        
        
    }
})