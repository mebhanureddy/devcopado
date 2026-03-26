@isTest
public class Test_Example3 {
    @isTest
    static void ted(){
        Apex_Example3 a=new  Apex_Example3();
        a.Industry= 'Banking';
        a.ifelse();
        system.assertEquals(a.Rating, 'Hot');
        system.assertEquals(a.Ownership, 'Public');  
        a.industry='Energy';
        a.ifelse();
        system.assertEquals(a.Rating, 'Warm');
        system.assertEquals(a.Ownership, 'Private');  
    }
}