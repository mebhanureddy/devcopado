trigger CityFieldUpdate on Account (after update) {
   List<Contact> contactList = new List<Contact>();
   List<Contact> contactList1 = new List<Contact>();
   for(Account acc: [SELECT Id,Name,(SELECT Id,FirstName FROM Contacts) FROM Account WHERE Id in: Trigger.new]){
      If(acc.Contacts.size()>0){
           contactList.addAll(acc.Contacts);
       }
       for(contact c:contactList){
       c.FirstName=acc.Name;
       contactList1.add(c);
   }
   }
   update contactList1;
}