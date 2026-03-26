@isTest
public class Test_Example5 {
	@isTest
    static void t(){
        Apex_Example5 a=new Apex_Example5();
        a.create();
        System.assertEquals(a.name, 'name');
        System.assertEquals(a.rating, 'rating');
        System.assertEquals(a.phone, 'phone');
    }
    @isTest
    static void j(){
        Account acc=new account();
        acc.Name='Testing';
        insert acc;
    }
}