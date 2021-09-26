({
       // Load camping items from Salesforce
    doInit: function(component, event, helper) {
		console.log('doinit fired in shopduties list')
	        // Create the action
       helper.doInitHelper(component);
    },
    
	handleAddItem: function(component, event, helper) {
        console.log('hadleadditem fired');
        let newItem = event.getParam("item");
        //console.log(newItem);
        helper.addItem(component, newItem);
        //helper.filterItemsHelper(component);
    },
    handleUpdateItemList:function(component, event, helper){
        console.log('handleUpdateItemList fired in shopDutiesList');
        let updateItemMessage = event.getParam("updateMessage");
        helper.updateItemListHelper(component, updateItemMessage);
        
        
    },
    handleListViewCheckboxGroupWeekdaysChange: function(component, event, helper){
        console.log(component.get('v.items'));
        helper.filterItemsHelper(component);
    },
    handleListViewCheckboxGroupActiveChange: function(component, event, helper){
        const changeValue = component.get("v.checkboxgroupvalueactive");
        
        console.log("check active changed");
        console.log(changeValue);
        helper.filterItemsHelper(component);
    }
    /*
     createItem: function(component, item) {
         let action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
         
         
    }
    */
})