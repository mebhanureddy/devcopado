({
    Phone : function(component, event, helper) {
        component.set("v.Phonerec", true);
        component.set("v.DetailPage", false);
        var param=component.get('v.selected');
        alert(param);
        var list1=component.get('v.phonelist');
        var list2=component.get('v.watchtlist');
        if(list1 == null || list2 == null){
            var action = component.get("c.Records");
            console.log('Records');
            action.setParams({
                objects:param
            });
            action.setCallback(this, function(response){
                if(param == 'Phone__c'){
                    component.set('v.Listofrecords', [
                        {label: 'Name', type: "button", typeAttributes: {label: { fieldName: 'Name' }}},
                        {label: 'Address', type: "text", fieldName: 'Address__c'},
                        {label: 'DOP', type: "date ", fieldName: 'Date_of_Purchase__c'},
                        {label: 'Owner', type: "text", fieldName: "Owner_Name__c"},
                        {label: 'Phone', type: "phone", fieldName: "Phone_No__c"},
                    ]);
                        component.set('v.phonetlist', response.getReturnValue());
                        component.set("v.phonerecList", response.getReturnValue());
                        }
                        else
                        {
                        if(param == 'Watch__c'){
                        component.set("v.studentrec", true);
                        console.log('Phone');
                        component.set('v.Listofrecords', [
                        {label: 'Name', type: "button", typeAttributes: {label: { fieldName: 'Name' }}},
                        {label: 'Address', type: "text", fieldName: 'Address__c	'},
                        {label: 'DOP', type: "date",fieldName: 'Date_of_Purchase__c'},
                        {label: 'Owner',type: "text", fieldName: 'Owner_Name__c'},
                        {label: 'Phone', type: "Phone", fieldName: 'Phone_No__c'},
                        {label: 'Store', type: "Picklist", fieldName: 'Store__c'},
                    ]);
                    component.set("v.watchlist", response.getReturnValue());
                    component.set("v.phonerecList", response.getReturnValue());
                }
            }
                               });
            $A.enqueueAction(action);
        }else if(param == 'Phone__c'){
            
            component.set('v.Listofrecords', [
                {label: 'Name', type: "button", typeAttributes: {label: { fieldName: 'Name' }}},
                {label: 'Address', type: "text", fieldName: 'Address__c'},
                {label: 'DOP', type: "date ", fieldName: 'Date_of_Purchase__c'},
                {label: 'Owner', type: "text", fieldName: "Owner_Name__c"},
                {label: 'Phone', type: "phone", fieldName: "Phone_No__c"},
            ]);
                component.set("v.phonerecList",list1);    
                }else{
                component.set('v.Listofrecords', [
                {label: 'Name', type: "button", typeAttributes: {label: { fieldName: 'Name' }}},
                {label: 'Address', type: "text", fieldName: 'Address__c	'},
                {label: 'DOP', type: "date",fieldName: 'Date_of_Purchase__c'},
                {label: 'Owner',type: "Text", fieldName: 'Owner_Name__c'},
                {label: 'Phone', type: "Phone", fieldName: 'Phone_No__c'},
                {label: 'Store', type: "Picklist", fieldName: 'Store__c'},
            ]);
            component.set("v.phonerecList",list2);
        }
    },
    createRecord:function(component, event, helper) {
        var param=component.get('v.selected');
        alert('Welcome');
        var createRecordEvent = $A.get("e.force:createRecord");
        alert('Welcome');
        createRecordEvent.setParams({
            "entityApiName": param
        });
        
        createRecordEvent.fire();
    },
    getid: function(component, event, helper)
    {
        var row = event.getParam('row');
        var ids=row.Id;
        component.set("v.Phonerec", false);
        var passid=component.set("v.idval",ids);
        alert(component.get("v.idval",ids));
        component.set("v.DetailPage",true);
    },
    BackToHome: function(component, event, helper){
        component.set("v.Phonerec", false);
        component.set("v.DetailPage", false);
    }
})