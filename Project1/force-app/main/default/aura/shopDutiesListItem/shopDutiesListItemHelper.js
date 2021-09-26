({
	updateItemHelper : function(component) {
		let item = component.get('v.item');
        
        let itemAction = component.get('c.updateItem');
        itemAction.setParams({'item': item});
       
            console.log("update item helper fired")
          	itemAction.setCallback(this, function(response){
            	let state = response.getState();
           
                if (state === "SUCCESS") {
                   
                	
            		component.set("v.item",response.getReturnValue());
                    
                    console.log('Success updating a item');
                    var updateActiveEvent = component.getEvent("updateItemEvent");
        			updateActiveEvent.setParams({ "updateMessage": "Updated Active Status" });
        			updateActiveEvent.fire();
            		 
            		
            	}
                else {
                	console.log("Failed with state: " + state);
           		}
       		 });
        	$A.enqueueAction(itemAction);
        	
	}
})