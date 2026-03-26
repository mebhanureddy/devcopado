public class Account_Contact_Event {
    @auraenabled
    public static id method1 (string Name,string Phone, string Industry){
        System.debug('Hsdn');
        Account acc=new account();
        acc.name=Name;
        acc.phone=Phone;
        acc.Industry=Industry;
        insert acc;
        id recid=acc.Id;
        return recid;
    }
    @auraenabled
    public static id Cmethod (string LastName,string Phone,Id AccId){
        System.debug('Hsdn');
        Contact con=new Contact();
        con.AccountId=AccId;
        System.debug('Acc  '+AccId);
        con.lastname=LastName;
        con.phone=Phone;
        insert con;
        id recid=con.Id;
        return recid;
    }
    
}