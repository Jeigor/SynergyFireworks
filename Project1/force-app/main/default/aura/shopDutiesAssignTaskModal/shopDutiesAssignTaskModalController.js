({
	closeModal:function(component,event,helper){   
        
		var cmpTarget = component.find('Modalbox');
		var cmpBack = component.find('Modalbackdrop');
		$A.util.removeClass(cmpBack,'slds-backdrop–open');
		$A.util.removeClass(cmpTarget, 'slds-fade-in-open'); 
    	},
	openmodal:function(component,event,helper) {
		var cmpTarget = component.find('Modalbox');
		var cmpBack = component.find('Modalbackdrop');
		$A.util.addClass(cmpTarget, 'slds-fade-in-open');
		$A.util.addClass(cmpBack, 'slds-backdrop–open'); 
	},
    closeModalEvent:function(component,event,helper){   
        
    	var selectedEmployeeGetFromEvent = event.getParam("closeMessage");
        
		console.log('close modal fired');  
        var cmpTarget = component.find('Modalbox');
		var cmpBack = component.find('Modalbackdrop');
		$A.util.removeClass(cmpBack,'slds-backdrop–open');
		$A.util.removeClass(cmpTarget, 'slds-fade-in-open'); 
        //alert(selectedEmployeeGetFromEvent);
	}
})