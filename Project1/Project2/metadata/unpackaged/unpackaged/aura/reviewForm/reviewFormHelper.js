({
	createReview: function(component, review) {
        console.log(review);
        let action = component.get("c.saveReview");
        action.setParams({
            "reviews": review
        });
        action.setCallback(this, function(response){
            let state = response.getState();            
            if (state === "SUCCESS") {
                let review = component.get("v.review");              
                component.set("v.review", review);
                console.log(review);
            }
        });
        $A.enqueueAction(action);
    },
})