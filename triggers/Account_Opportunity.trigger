trigger Account_Opportunity on Account (after insert) {
    List<Account> Acclist = Trigger.New;
    List<Opportunity> Opplist = New List <Opportunity> ();
    For (Account a : Acclist)
    {
        if(a.rating=='Hot' && a.Ownership=='Public')
        {
            Opportunity Opp = New Opportunity();
            Opp.Name=a.name;    
            Opp.StageName='Prospecting';
            Opp.CloseDate= System.today()+15;
            Opp.AccountId=a.Id;
            Opplist.add(Opp);
        }
    }
    Insert Opplist;
}