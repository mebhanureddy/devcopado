public class Apex_C3 {
@auraEnabled
    public static Decimal calculateinterest(integer principal, integer rate, integer years){
        decimal interest=(principal*rate*years)/100;
        return interest;
    }
}