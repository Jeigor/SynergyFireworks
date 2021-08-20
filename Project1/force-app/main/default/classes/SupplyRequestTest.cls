@isTest private class SupplyRequestTest {
    @isTest static void testSRDelete(){        
        List<Supply_Request__C> toBeInserted= new List<Supply_Request__C>();
        Supply_Request__c a = new Supply_Request__C(SupplyRequest__c = 'Bread', Supply_Amount__C = 'Baguette;Brioche;Rye;Sourdough', IsCompleted__c = True);
        Supply_Request__c b = new Supply_Request__C(SupplyRequest__c = 'Meat', Supply_Amount__C = 'Beef;Steak;Turkey;Ham', IsCompleted__c = True);
        Supply_Request__c c = new Supply_Request__C(SupplyRequest__c = 'Drinks', Supply_Amount__C = 'Coke Products;Water', IsCompleted__c = True);
        Supply_Request__c d = new Supply_Request__C(SupplyRequest__c = 'Utensils', Supply_Amount__C = 'Cups;Plates;Knifes/Forks/Spoons', IsCompleted__c = True);
        Supply_Request__c e = new Supply_Request__C(SupplyRequest__c = 'Cleaning Supplies', Supply_Amount__C = 'Bleach;Windex;Oxyclean', IsCompleted__c = True);
        Inventory__C inv1 = new Inventory__C(Name = 'Baguette Bread', Inventory_Unit__c = 'Baguette Bread', Inventory_Amount__c = 52);
        Inventory__C inv2 = new Inventory__C(Name = 'Brioche Bread', Inventory_Unit__c = 'Brioche Bread', Inventory_Amount__c = 52);
        Inventory__C inv3 = new Inventory__C(Name = 'Rye Bread', Inventory_Unit__c = 'Rye Bread', Inventory_Amount__c = 52);
        Inventory__C inv4 = new Inventory__C(Name = 'Sourdough Bread', Inventory_Unit__c = 'Sourdough Bread', Inventory_Amount__c = 52);
        Inventory__C inv5 = new Inventory__C(Name = 'Beef', Inventory_Unit__c = 'Beef', Inventory_Amount__c = 52);
        Inventory__C inv6 = new Inventory__C(Name = 'Steak', Inventory_Unit__c = 'Steak', Inventory_Amount__c = 52);
        Inventory__C inv7 = new Inventory__C(Name = 'Turkey', Inventory_Unit__c = 'Turkey', Inventory_Amount__c = 52);
        Inventory__C inv8 = new Inventory__C(Name = 'Ham', Inventory_Unit__c = 'Ham', Inventory_Amount__c = 52);
        Inventory__C inv9 = new Inventory__C(Name = 'Coke Product', Inventory_Unit__c = 'Coke Product', Inventory_Amount__c = 52);
        Inventory__C inv10 = new Inventory__C(Name = 'Water', Inventory_Unit__c = 'Water', Inventory_Amount__c = 52);
        Inventory__C inv11 = new Inventory__C(Name = 'Cups', Inventory_Unit__c = 'Cups', Inventory_Amount__c = 52);
        Inventory__C inv12 = new Inventory__C(Name = 'Plates', Inventory_Unit__c = 'Plates', Inventory_Amount__c = 52);
        Inventory__C inv13 = new Inventory__C(Name = 'Eating Utensils', Inventory_Unit__c = 'Eating Utensils', Inventory_Amount__c = 52);
        Inventory__C inv14 = new Inventory__C(Name = 'Bleach', Inventory_Unit__c = 'Bleach', Inventory_Amount__c = 52);
        Inventory__C inv15 = new Inventory__C(Name = 'Windex', Inventory_Unit__c = 'Windex', Inventory_Amount__c = 52);
        Inventory__C inv16 = new Inventory__C(Name = 'Oxyclean', Inventory_Unit__c = 'Oxyclean', Inventory_Amount__c = 52);
        toBeInserted.add(a);
        toBeInserted.add(b);
        toBeInserted.add(c);
        toBeInserted.add(d);
        toBeInserted.add(e);
        
        insert inv1;
        insert inv2;
        insert inv3;
        insert inv4;
        insert inv5;
        insert inv6;
        insert inv7;
        insert inv8;
        insert inv9;
        insert inv10;
        insert inv11;
        insert inv12;
        insert inv13;
        insert inv14;
        insert inv15;
        insert inv16;
        insert a;
        insert b;
        insert c;
        insert d;
        insert e;        
        
        Test.startTest();
        Database.DeleteResult result1 = Database.Delete(a, false);
        Test.stopTest();
        System.assert(!result1.isSuccess());
        System.assert(result1.getErrors().size()> 0);
        System.assertEquals('Cannot delete Request that has been completed',
                             result1.getErrors()[0].getMessage());
    }
    @isTest static void testSRUpdate1(){        
        List<Supply_Request__C> toBeInserted= new List<Supply_Request__C>();
        Supply_Request__c a = new Supply_Request__C(SupplyRequest__c = 'Bread', Supply_Amount__C = 'Baguette;Brioche;Rye;Sourdough', IsCompleted__c = True);
        Supply_Request__c b = new Supply_Request__C(SupplyRequest__c = 'Meat', Supply_Amount__C = 'Beef;Steak;Turkey;Ham', IsCompleted__c = false);
        Supply_Request__c c = new Supply_Request__C(SupplyRequest__c = 'Drinks', Supply_Amount__C = 'Coke Products;Water', IsCompleted__c = True);
        Supply_Request__c d = new Supply_Request__C(SupplyRequest__c = 'Utensils', Supply_Amount__C = 'Cups;Plates;Knifes/Forks/Spoons', IsCompleted__c = True);
        Supply_Request__c e = new Supply_Request__C(SupplyRequest__c = 'Cleaning Supplies', Supply_Amount__C = 'Bleach;Windex;Oxyclean', IsCompleted__c = True);
        Inventory__C inv1 = new Inventory__C(Name = 'Baguette Bread', Inventory_Unit__c = 'Baguette Bread', Inventory_Amount__c = 52);
        Inventory__C inv2 = new Inventory__C(Name = 'Brioche Bread', Inventory_Unit__c = 'Brioche Bread', Inventory_Amount__c = 52);
        Inventory__C inv3 = new Inventory__C(Name = 'Rye Bread', Inventory_Unit__c = 'Rye Bread', Inventory_Amount__c = 52);
        Inventory__C inv4 = new Inventory__C(Name = 'Sourdough Bread', Inventory_Unit__c = 'Sourdough Bread', Inventory_Amount__c = 52);
        Inventory__C inv5 = new Inventory__C(Name = 'Beef', Inventory_Unit__c = 'Beef', Inventory_Amount__c = 52);
        Inventory__C inv6 = new Inventory__C(Name = 'Steak', Inventory_Unit__c = 'Steak', Inventory_Amount__c = 52);
        Inventory__C inv7 = new Inventory__C(Name = 'Turkey', Inventory_Unit__c = 'Turkey', Inventory_Amount__c = 52);
        Inventory__C inv8 = new Inventory__C(Name = 'Ham', Inventory_Unit__c = 'Ham', Inventory_Amount__c = 52);
        Inventory__C inv9 = new Inventory__C(Name = 'Coke Product', Inventory_Unit__c = 'Coke Product', Inventory_Amount__c = 52);
        Inventory__C inv10 = new Inventory__C(Name = 'Water', Inventory_Unit__c = 'Water', Inventory_Amount__c = 52);
        Inventory__C inv11 = new Inventory__C(Name = 'Cups', Inventory_Unit__c = 'Cups', Inventory_Amount__c = 52);
        Inventory__C inv12 = new Inventory__C(Name = 'Plates', Inventory_Unit__c = 'Plates', Inventory_Amount__c = 52);
        Inventory__C inv13 = new Inventory__C(Name = 'Eating Utensils', Inventory_Unit__c = 'Eating Utensils', Inventory_Amount__c = 52);
        Inventory__C inv14 = new Inventory__C(Name = 'Bleach', Inventory_Unit__c = 'Bleach', Inventory_Amount__c = 52);
        Inventory__C inv15 = new Inventory__C(Name = 'Windex', Inventory_Unit__c = 'Windex', Inventory_Amount__c = 52);
        Inventory__C inv16 = new Inventory__C(Name = 'Oxyclean', Inventory_Unit__c = 'Oxyclean', Inventory_Amount__c = 52);
        toBeInserted.add(a);
        toBeInserted.add(b);
        toBeInserted.add(c);
        toBeInserted.add(d);
        toBeInserted.add(e);
        
        insert inv1;
        insert inv2;
        insert inv3;
        insert inv4;
        insert inv5;
        insert inv6;
        insert inv7;
        insert inv8;
        insert inv9;
        insert inv10;
        insert inv11;
        insert inv12;
        insert inv13;
        insert inv14;
        insert inv15;
        insert inv16;
        insert a;
        insert b;
        insert c;
        insert d;
        insert e;        
        
        Test.startTest();
        a.IsCompleted__c = false;
        Database.saveResult result1 = Database.update(a, false);
        Test.stopTest();        
        System.assert(!result1.isSuccess());
        System.assert(result1.getErrors().size()> 0);
        System.assertEquals('Cannot update Request that has been completed',
                             result1.getErrors()[0].getMessage());
    }
    @isTest static void testSRUpdate2(){        
        Supply_Request__c b = new Supply_Request__C(SupplyRequest__c = 'Meat', Supply_Amount__C = 'Beef;Steak;Turkey;Ham', IsCompleted__c = false);
        Inventory__C inv1 = new Inventory__C(Name = 'Baguette Bread', Inventory_Unit__c = 'Baguette Bread', Inventory_Amount__c = 52);
        Inventory__C inv2 = new Inventory__C(Name = 'Brioche Bread', Inventory_Unit__c = 'Brioche Bread', Inventory_Amount__c = 52);
        Inventory__C inv3 = new Inventory__C(Name = 'Rye Bread', Inventory_Unit__c = 'Rye Bread', Inventory_Amount__c = 52);
        Inventory__C inv4 = new Inventory__C(Name = 'Sourdough Bread', Inventory_Unit__c = 'Sourdough Bread', Inventory_Amount__c = 52);
        Inventory__C inv5 = new Inventory__C(Name = 'Beef', Inventory_Unit__c = 'Beef', Inventory_Amount__c = 52);
        Inventory__C inv6 = new Inventory__C(Name = 'Steak', Inventory_Unit__c = 'Steak', Inventory_Amount__c = 52);
        Inventory__C inv7 = new Inventory__C(Name = 'Turkey', Inventory_Unit__c = 'Turkey', Inventory_Amount__c = 52);
        Inventory__C inv8 = new Inventory__C(Name = 'Ham', Inventory_Unit__c = 'Ham', Inventory_Amount__c = 52);
        Inventory__C inv9 = new Inventory__C(Name = 'Coke Product', Inventory_Unit__c = 'Coke Product', Inventory_Amount__c = 52);
        Inventory__C inv10 = new Inventory__C(Name = 'Water', Inventory_Unit__c = 'Water', Inventory_Amount__c = 52);
        Inventory__C inv11 = new Inventory__C(Name = 'Cups', Inventory_Unit__c = 'Cups', Inventory_Amount__c = 52);
        Inventory__C inv12 = new Inventory__C(Name = 'Plates', Inventory_Unit__c = 'Plates', Inventory_Amount__c = 52);
        Inventory__C inv13 = new Inventory__C(Name = 'Eating Utensils', Inventory_Unit__c = 'Eating Utensils', Inventory_Amount__c = 52);
        Inventory__C inv14 = new Inventory__C(Name = 'Bleach', Inventory_Unit__c = 'Bleach', Inventory_Amount__c = 52);
        Inventory__C inv15 = new Inventory__C(Name = 'Windex', Inventory_Unit__c = 'Windex', Inventory_Amount__c = 52);
        Inventory__C inv16 = new Inventory__C(Name = 'Oxyclean', Inventory_Unit__c = 'Oxyclean', Inventory_Amount__c = 52);
        
        insert inv1;
        insert inv2;
        insert inv3;
        insert inv4;
        insert inv5;
        insert inv6;
        insert inv7;
        insert inv8;
        insert inv9;
        insert inv10;
        insert inv11;
        insert inv12;
        insert inv13;
        insert inv14;
        insert inv15;
        insert inv16;
        insert b;
        
        
        Test.StartTest();
        b.IsCompleted__C = true;
        Database.saveResult result2 = Database.update(b, true);
        Test.StopTest();
        System.assert(result2.isSuccess());
        System.assert(result2.getErrors().size()< 0);
        
    }
    
}