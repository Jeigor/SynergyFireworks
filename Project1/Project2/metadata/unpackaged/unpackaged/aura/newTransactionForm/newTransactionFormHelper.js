({
    createTran: function(component, newTran) {
        //newTran = JSON.parse(JSON.stringify(newTran));
        console.log(newTran);
        let addTran = component.getEvent("addTran");
        addTran.setParams({ "tran": newTran });
        addTran.fire();
        let blankObject = "{ 'sobjectType': 'Transaction__c', 'Drink_Included__c': false, 'Utensils_Included__c': false }";
        console.log(newTran);    
        component.set("v.newTran", blankObject);
        console.log("v.newTran");
    },
})