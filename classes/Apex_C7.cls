public class Apex_C7 {
    @Auraenabled
    public Static Id Invoke(Contact con){
        insert con;
        return con.Id;
    }
}