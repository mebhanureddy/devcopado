public class Apex_AccDispLayout {
    @Auraenabled
    public static list<Account> AccDisplay(){
        List<account> Accounts=[select id,name,phone,industry,rating from Account];
                System.debug('sjagv'+Accounts);
        return Accounts;
    }
}