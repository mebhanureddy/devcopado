trigger Top_X_Designation_OPPORTUNITY on Opportunity (after insert) {
    List <Top_X_Designation__c> TopX=[Select id, Type__c, Document_Attached__c, (Select id, Handoff_Attached__c from Opportunities__r where id in:trigger.new) from Top_X_Designation__c ];
    list<opportunity> opp = new  list<opportunity>();
    for(Top_X_Designation__c TOP: TopX){
        if(TOP.Type__c=='Handoff' || TOP.Type__c=='Contract Flow Down'  && TOP.Document_Attached__c==True){
          //  TOP.Handoff_Attached__c='Yes';
        }
    }
update opp;
}