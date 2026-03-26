public class Account_Contact_Event_Contact {
@auraenabled
    public static id Cmethod (string LastName,string Phone,Id AccId){
       System.debug('Hsdn');
       Contact con=new Contact();
            con.AccountId=AccId;
            con.lastname=LastName;
            con.phone=Phone;
            insert con;
         id recid=con.Id;
           return recid;
    }
}