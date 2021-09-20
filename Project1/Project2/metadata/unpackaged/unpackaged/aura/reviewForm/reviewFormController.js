({
	addReview : function(component, event, helper) {
        let review = component.get("v.review");
        let tran = component.get("v.tran");
        component.set("v.review.Rating__c", component.find('rating').get('v.value'));
        component.set("v.review.Product_Name__c", tran.Id);
        review = JSON.parse(JSON.stringify(review));
        console.log(review);
        helper.createReview(component, review);
    }
})