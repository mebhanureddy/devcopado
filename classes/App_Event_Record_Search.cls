public class App_Event_Record_Search {
    @AuraEnabled
    public static list<Account> acclist (string param)
    {
        string abc='%'+param+'%';
        list<Account> acc=new list<Account>();
        if (param!=null){
           acc=[select id, name from Account where name like: abc];
            system.debug('Acc List  '+acc);
        }else{
            acc=[select id, name from Account limit 15];
            system.debug('Acc List is null '+acc);
           }  
         return acc;
    }
    @AuraEnabled
    public static list<Contact> conlist( id conid)
    {
        list<Contact> con=[select id, lastname from Contact where AccountId=:conid];
        return con;
    }
    @AuraEnabled
    public static list<Opportunity> opplist( id oppid)
    {
        list<Opportunity> opp=[select id, name from Opportunity where AccountId=:oppid];
        return opp;
    }
}