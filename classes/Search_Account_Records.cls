public class Search_Account_Records {
    public list<Account> acc {set;get;}
    public String searchkey {get;set;}
    
    public void search(){
        string searchquery ='select Name, Phone from account where name like \'%'+searchKey+'%\' Limit 10' ;
        acc = Database.query(searchquery);
    }
    
    public void clear(){
        acc.clear();
    }
}