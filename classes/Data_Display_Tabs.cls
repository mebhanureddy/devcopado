public class Data_Display_Tabs {
    @auraEnabled
    public static list<Contact> conlist(){
        list<contact> con=[select id, name,accountid, account.name from contact where accountid!=null];
        return con;
    }
    @auraEnabled
    public static list<account> acclist(){
        list<account> acc=[select id, name,(select id, name from contacts) from account];
        return acc;
    }
}