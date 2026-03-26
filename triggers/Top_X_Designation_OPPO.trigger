trigger Top_X_Designation_OPPO on Top_X_Designation__c (after insert) {
  // map<id,id> topmap = new map<id,id>();
    List <Top_X_Designation__c> TopX=[Select id, Type__c, Document_Attached__c, (Select id, Handoff_Attached__c from Opportunities__r) from Top_X_Designation__c Where (Type__c='Handoff' OR Type__c='Contract Flow Down' ) AND Document_Attached__c=True AND id in:trigger.new ];
   System.debug('TOP'+TopX);
    list<opportunity> opp = new  list<opportunity>();
    for(Top_X_Designation__c TOP: TopX){
        System.debug('TOP'+TOP);
        for(opportunity op:TOP.opportunities__r){
           op.Handoff_Attached__c='Yes';
            opp.add(op);
        }
    }update opp;
    
}