trigger Contphoneupdate on Account (after update) {
    List <Id> aid=new  List <Id>();
    List <Contact> conlist = new list <Contact> ();
    List <account> acclist =[SELECT Id, Phone, (select id,phone from contacts) from Account where id =: Trigger.new];
    for(account a : acclist){
        for(contact c: a.contacts){
        c.Phone= a.Phone   ;
        conlist.add(c);
    }
    update conlist;
}
}