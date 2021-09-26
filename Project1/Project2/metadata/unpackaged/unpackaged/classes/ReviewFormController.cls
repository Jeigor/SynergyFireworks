public class ReviewFormController {
	    @AuraEnabled
    public static Review__c saveReview(Review__c reviews) {
        // Perform isUpdateable() checking first, then
        upsert reviews;
        return reviews;
    }
}