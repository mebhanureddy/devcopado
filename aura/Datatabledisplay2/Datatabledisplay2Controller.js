({
    help : function(component,event,helper) {
        var select = component.get('v.selected');
        component.set('v.Lists', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Owner', fieldName: 'Owner_Name__c', type: 'text'},
            {label: 'Phone', fieldName: 'Phone_No__c', type: 'Phone'},
            {label: 'Date of Purchase', fieldName: 'Date_of_Purchase__c', type: 'date'},
            {label: 'Locality', fieldName: 'Address__c', type: 'text'},        
            {label: 'Store', fieldName: 'Store__c', type: 'picklist'},
        ]);
            var action = component.get("c.Records");
            action.setParams({
            objects : select
            });
            action.setCallback(this, function(response){
            if (select == "Phone__c") {
            console.log('PRINT'+select);
            component.set("v.phonerecs", response.getReturnValue());
            component.set("v.recList", response.getReturnValue());
            alert(response.getReturnValue());
            }
            else
            if (select == "Watch__c") {
            component.set("v.watchrecs", response.getReturnValue());
            component.set("v.recList", response.getReturnValue());
            alert(response.getReturnValue());
            }
            });
            if(component.get("v.phonerecs") == null || component.get("v.watchrecs") == null ){
            $A.enqueueAction(action);
            }
            },
            })