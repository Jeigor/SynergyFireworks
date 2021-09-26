({
	SaveApp : function(component, event, helper) {
		let action = component.get("c.SaveApplication");
        var App = component.get("v.App");
        action.setParams({
            "App": App
        })
        action.setCallback(this,function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
               var toastEvent = $A.get("e.force:showToast");  
            toastEvent.setParams({
                    "title": "Success!",
                        "message": "The Duty Active Status Was Updated Successfully."
            });
        toastEvent.fire();
               // App.push(response.getReturnValue());
                component.set("v.App", App);
               // component.push("v.App", App);
            }
            else if(state ==="ERROR"){
              console.log('Problem saving record, error:' + 
               JSON.stringify(response.error));
    var errMsg ="";
    for(var i=0; i< response.error.length;i++){
        errMsg += response.error[i].message + "\n";
    }
    component.set("v.recordSaveError", errMsg);
                                     
            }
        })
        
        $A.enqueueAction(action);
        
	}
})