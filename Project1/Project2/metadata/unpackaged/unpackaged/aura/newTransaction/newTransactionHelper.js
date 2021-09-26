({

    saveTran: function(component, newTran){
        let action = component.get("c.saveTran");
        action.setParams({
            "trans": newTran
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let trans = component.get("v.trans");
                trans.push(response.getReturnValue());
                component.set("v.trans", trans);
            }
        });
        $A.enqueueAction(action);
    }
})