public class soqlkk {
    List <Account> accs{get;set;}
    public soqlkk(){
        accs= new list<account>();
    for(Integer i=0;i<10;i++){
        Account a= new Account(Name='Response'+i, Industry='Electronics', Rating='Warm');
        accs.add(a);
    }
        Insert accs;
}
}