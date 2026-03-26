// When ever the opportunity stage name is modified to closewon then create student as opportunity Teammember.
trigger Opp_Team on Opportunity (after insert) {
    Map<Id,Opportunity> OldMap = Trigger.OldMap;
    Map<Id,Opportunity> NewMap = Trigger.NewMap;
    Set<Id> Keys=OldMap.keySet();
    //List<OpportunityTeamMember> Teams =new List<OpportunityTeamMember> ();
    for (Id k : Keys)
    {
        //Opportunity OldOpt = OldMap.get(k);
         
    }
}