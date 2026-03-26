public class Apex_Example5 {
	public string name;
    public string rating;
    public string phone;
    public void create(){
        Account acc =new Account();
        acc.Name=name;
        acc.Rating=rating;
        acc.Phone=phone;
        insert acc;
    }
    public void modifyData(){
        List <Account> accs= [select id, rating from Account];
        for (Account a: accs){
            a.rating='Warm';
        }
        update accs;
    }
}