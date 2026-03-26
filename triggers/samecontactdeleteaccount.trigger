trigger samecontactdeleteaccount on Account (before insert) {
    List <String> myname =new List <String> ();
    for (Account a: trigger.new){
        myname.add(a.Name);
    }        
    List <Contact> mycontact= [Select name from contact where name IN : myname];
    delete mycontact;
}