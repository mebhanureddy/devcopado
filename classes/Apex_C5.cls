public class Apex_C5 {
    @Auraenabled
    public static string create (string name,string phone, string industry){
        string result;
        try{ Account acc=new account();
            acc.name=name;
            acc.phone=phone;
            acc.Industry=industry;
            insert acc;
            result='Account is succesfully inserted';
           }catch(Exception e){
               result='Account insertion failed ' +e.getTypeName();
           }
        return result;
    }
}