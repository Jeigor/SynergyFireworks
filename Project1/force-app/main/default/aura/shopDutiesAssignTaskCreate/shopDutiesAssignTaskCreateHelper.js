({
	closeModal : function(component, message){      
    // get the selected record from list  
     
    // call the event   
      var compEvent = component.getEvent("closeModalEvent");
    // set the Selected sObject Record to the event attribute.  
        compEvent.setParams({"closeMessage" : message });  
    // fire the event  
         compEvent.fire();
    },
})