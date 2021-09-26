({
   onfocus : function(component,event,helper){
       $A.util.addClass(component.find("mySpinner"), "slds-show");
        var forOpen = component.find("searchRes");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
        // Get Default 10 Records order by createdDate DESC  
         var getInputkeyWord = '';
         helper.searchHelper(component,event,getInputkeyWord);
    },
    onblur : function(component,event,helper){       
        component.set("v.listOfSearchRecords", null );
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    keyPressController : function(component, event, helper) {
       // get the search Input keyword   
         var getInputkeyWord = component.get("v.SearchKeyWord");
       // check if getInputKeyWord size id more then 0 then open the lookup result List and 
       // call the helper 
       // else close the lookup result List part.   
        if( getInputkeyWord.length > 0 ){
             var forOpen = component.find("searchRes");
               $A.util.addClass(forOpen, 'slds-is-open');
               $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord);
        }
        /*
        else{  
             component.set("v.listOfSearchRecords", null ); 
             var forclose = component.find("searchRes");
               $A.util.addClass(forclose, 'slds-is-close');
               $A.util.removeClass(forclose, 'slds-is-open');
          }
          */
	},
    
  // function for clear the Record Selection 
    clear :function(component, event, helper){
        
        var name = event.getParam("item").name;
        //console.log( "pill removed clear: "+name);
        //alert(name + ' pill was removed!');
        // Remove the pill from view
        let emplRecs = component.get('v.employeeRecs');
        
        
        
       let items = component.get('v.selectedRecords');
     
        //console.log(emplRecs);
        //console.log(items);
        
		//console.log('recordd to be cleared');	
		//console.log(typeof emplRecs)


       	let newEmployeeSelectedList = [];
        if(typeof emplRecs !== 'undefined'){
            //console.log('test');
            //console.log(emplRecs.length);
            //console.log(name);
            //console.log(emplRecs[0].Name);
        	for(let i = 0 ; i < emplRecs.length; i++){
            	if(emplRecs[i].Name  !== name){
                	//console.log('dont remove ' + name);
                	newEmployeeSelectedList.push(emplRecs[i]);
            	}
                console.log('test 2')
        	}
        }
        console.log(newEmployeeSelectedList);
        let newPillContainerSelectedList=[];
        if(typeof items!=='undefined'){
			for(let i = 0 ; i<items.length; i++){
            	if(items[i].name!=name){
                	//console.log('dont remove pill container item' + name);
                	newPillContainerSelectedList.push(items[i]);
                
            	}
        	}
        }
        //newEmployeeSelectedList = emplRecs.filter(item => item.Name !== deletedPillName)
		//newPillContainerSelectedList = items.filter(item => item.name !== deletedPillName)

        //console.log(arr)
    	//oListItem.deleteObject();
       	
        //items.splice(item, 1);
        //emplRecs.splice(item,1)
    	component.set('v.selectedRecords', newPillContainerSelectedList);
        component.set('v.employeeRecs', newEmployeeSelectedList);
        //console.log("new employee to assign list");
        //console.log(newEmployeeSelectedList);
     	//console.log("new pill container list");
        //console.log(newPillContainerSelectedList);
        
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
       //var selRecs=component.get('v.selectedRecords');
        
      
         $A.util.addClass(pillTarget, 'slds-hide');
         $A.util.removeClass(pillTarget, 'slds-show');
        
         $A.util.addClass(lookUpTarget, 'slds-show');
         $A.util.removeClass(lookUpTarget, 'slds-hide');
      /*
         component.set("v.SearchKeyWord",null);
         component.set("v.listOfSearchRecords", null );
         component.set("v.selectedRecord", {} );  
        component.set("v.selectedRecords",[] );
    */
    },
    
  // This function call when the end User Select any record from the result list.   
    handleComponentEvent : function(component, event, helper) {
   	 
       var selectedEmployeeGetFromEvent = event.getParam("recordByEvent");
	  
      
      
      
        
        var selRecs = component.get('v.selectedRecords');
        var selRecContainerInfo = {type: 'avatar', name:selectedEmployeeGetFromEvent.Name , label: selectedEmployeeGetFromEvent.Full_Name__c, fallbackIconName: 'standard:user', variant: 'circle'};
        
        
       //	selRecs.forEach(selr => {
			//console.log(selr['name']);
           // console.log(selr['name']=== selectedEmployeeGetFromEvent.Name);
		//});
            
        let addToSelected = true;  
        selRecs.every(v => {
  			if (v['name']=== selectedEmployeeGetFromEvent.Name) {
    			console.log(v['name']);
            	addToSelected = false;
 			 }
			 ///console.log(v);
        
  			// Make sure you return true. If you don't return a value, `every()` will stop.
  			return addToSelected;
		});

    if (addToSelected){
  
      //	console.log('adding to selected');
       
        	selRecs.push(selRecContainerInfo);
        	component.set("v.selectedRecords", selRecs);
    		component.set("v.listOfSearchRecords", null);
        	
    		var employeeRecList = component.get("v.employeeRecs");
    		if(typeof employeeRecList==='undefined'){
    			employeeRecList=[];
			}
    		console.log(employeeRecList);	
        	employeeRecList.push(selectedEmployeeGetFromEvent);
    		console.log(employeeRecList);
			console.log(employeeRecList[0].Full_Name__c)
			
            component.set("v.employeeRecs", employeeRecList);
}			employeeRecList = component.get("v.employeeRecs");
         	console.log(employeeRecList);
			


			component.set('v.SearchKeyWord', "");
			
			
        /*
        var forclose = component.find("lookup-pill");
           $A.util.addClass(forclose, 'slds-show');
           $A.util.removeClass(forclose, 'slds-hide');
  	*/
        var forclose = component.find("searchRes");
           $A.util.addClass(forclose, 'slds-is-close');
           $A.util.removeClass(forclose, 'slds-is-open');
        /*
        var lookUpTarget = component.find("lookupField");
            $A.util.addClass(lookUpTarget, 'slds-hide');
            $A.util.removeClass(lookUpTarget, 'slds-show');  
      */
	},
 
})