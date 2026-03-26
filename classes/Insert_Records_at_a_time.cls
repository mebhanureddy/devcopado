public class Insert_Records_at_a_time {
    public account acc{set;get;}
    public contact con{set;get;}
    public opportunity opp{set;get;}
    public Insert_Records_at_a_time(){
        acc=new account();
        con=new contact();
        opp=new opportunity();
    }
    public void save(){
        insert acc;
        con.AccountId=acc.id;
        opp.AccountId=acc.id;
        insert con;
        insert opp;
    }
}