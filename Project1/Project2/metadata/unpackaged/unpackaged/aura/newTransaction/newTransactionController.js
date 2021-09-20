({
    	    // Load transactions from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getTrans");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.trans", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
	handleAddTran: function(component, event, helper) {
        let newTran = event.getParam("tran");
        helper.saveTran(component, newTran);
    },
    

})