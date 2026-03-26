public class Apex_C4 {
@AuraEnabled
    public static List<Account> callMe(){
        List<account> acc=[select name, phone from Account];
        return acc;
    }
}