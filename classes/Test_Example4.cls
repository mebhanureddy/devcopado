@isTest
public class Test_Example4 {
    @isTest
    static void hh(){
        Apex_Example4 a=new Apex_Example4();
        a.typeName='New Customer';
        a.hey();
        system.assertEquals(a.closeDate, System.today()+15);
        system.assertEquals(a.stageName, 'Prospecting');
        a.typeName='Existing Customer';
        a.hey();
        system.assertEquals(a.closeDate, System.today());
        system.assertEquals(a.stageName, 'Closed Won');
    }
}