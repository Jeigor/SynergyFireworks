({
    addOrder : function(component, event, helper) {
        alert('Your order is being prapared. Thank you for your business.');
        let validItem = component.find('transactionform').reduce(function (validSoFar, inputCmp) {
        	// Display error messages for invalid fields
        	inputCmp.showHelpMessageIfInvalid();
        	return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        console.log(validItem);
    	// If we pass error checking, do some real work
    	if(validItem){
    		// create the new transaction
    		let newTran = component.get("v.newTran");
    		component.set("v.newTran.Bread_Type__c", component.find('bread').get('v.value'));
            component.set("v.newTran.Drink__c", component.find('drink').get('v.value'));
            component.set("v.newTran.Meat_Type__c", component.find('meat').get('v.value'));
            //component.set("v.newTran.Utensils_Included__c", component.find('utensils').get('v.value'));
    		
            // Copy the tran to a new object            
            newTran = JSON.parse(JSON.stringify(newTran));
            console.log(newTran);
            helper.createTran(component, newTran);
            
            
		}
	}
})