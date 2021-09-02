# SynergyFireworks
## Each class has its own functionality for the org:

The Controller and testing for the controller for application page
- ApplicationControllerExtension
- ApplicationControllerTest

  
Method and testing for the trigger on supply request custom object
- SupplyRequestHandler 
- SupplyRequestTest

  
Method and testing for the trigger on Transaction custom object
- TransactionHandler
- TransactionTriggerTest

  
Controller and testing for the **Transaction** visualforce page
- TransactionController
- TransactionpageControllerTest

  
Controller and testing for the **Task** visualforce page
- TaskExtensionControllerTest
- TaskExtensionController


Controller and extra class for the **Popular Inventory** page
- PopularInventoryControler
- PopularityObject

Flow: 

StandardTaskUpdateInventoryFlow

## What to Import:

### Visualforce Pages
- ManageTasks
- ApplicationPage
- NewTransaction
- ThankYouForOrdering
- PopularItems


### Triggers
- SupplyRequestTrigger - inventory update
- TransactionTrigger - inventory update and validation 
	
### Classes
- PopularityObject.cls
- ApplicationControllerExtension
- ApplicationControllerTest
- PopularInventoryControler
- SupplyRequestHandler
- SupplyRequestTest
- TaskExtensionController
- TaskExtensionControllerTest
- TransactionContoller
- TransactionController
- TransactionHandler
- TransactionTriggerTest
- TransactionpageControllerTest

## Suggestions for future implementations

- Marketing
	- sell more sandwitches
	- look into more than one marketing strategy

- create actual sandwitch types 
- Login page??
- item sold statistics
	- show purchases over a period of time
	- make estimations about the future


## Suggestions for Deploying to Org

-Applicant custom object
	
	-Check if all the fields are readable for the roles needed

