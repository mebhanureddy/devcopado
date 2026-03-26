public class Apex_C6 {
@auraenabled
    public static string createacc(Account acc){
        string result;
        try{
            insert acc;
            result='Account inserted';
        }
        catch(Exception e){
            result='Insertion Failed'+e.getTypeName();
        }
        return result;
    }
}