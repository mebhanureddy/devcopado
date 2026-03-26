trigger upconphn on Account (before update) {
    List<Contact> listConForPhoneUpdate= new  List<Contact>();
    for (Account acc : Trigger.New)
    {
         listConForPhoneUpdate = [Select Phone from Contact 
            where Phone != null and AccountID =: acc.id];

        for(Contact con : listConForPhoneUpdate)
            con.Phone = acc.Phone;
    }

    update listConForPhoneUpdate;
}