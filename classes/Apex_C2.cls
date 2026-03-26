public class Apex_C2 {
@AuraEnabled
    public static string callMe(string firstname,String lastname){
        string name=firstname+''+lastname;
        return name;
    }
}