@isTest
public class Test_Example2 {
	@isTest
    static Void testM(){
        Apex_Example2 a =  new Apex_Example2();
        a.iii();
        system.assertEquals(a.Industry,'Banking');
        system.assertEquals(a.Rating,'Hot');
        a.Well();
 system.assertEquals(a.Industry,'Energy');
        system.assertEquals(a.Rating,'Warm');
        
    }
}