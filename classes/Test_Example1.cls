@isTest
public class Test_Example1 {
    @isTest
    static void testme(){
        Apex_Example1 ae =new Apex_Example1();
        ae.thu();
        system.assertEquals(ae.name, 'Sathish');
        system.assertEquals(ae.city, 'Hyd');
        ae.ku();
        system.assertEquals(ae.name,'Bhanu');
        system.assertEquals(ae.city,'Ban');
    } 
}