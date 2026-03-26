({
    school : function(component, event, helper) {
        var param=component.get('v.selected');
        var action = component.get('c.Records');
        action.setParams({
            param:param
        });
        var list1=component.get('v.teacherlist');
        var list2=component.get('v.studentlist');
        if(list1 == null || list2 == null){
            action.setCallback(this, function(response){
                if(param == 'Phone__c'){
                    alert('13');
                    component.set('v.Listofrecords', [
                        {label: 'Name', fieldName: 'Name', type: 'text'},
                        {label: 'Owner', fieldName: 'Owner_Name__c', type: 'text'},
                        {label: 'Phone', fieldName: 'Phone_No__c', type: 'Phone'},
                        {label: 'Date of Purchase', fieldName: 'Date_of_Purchase__c', type: 'date'},
                        {label: 'Locality', fieldName: 'Address__c', type: 'text'}, 
                    ]);
                        component.set('v.teacherlist', response.getReturnValue());
                        component.set("v.schoolrecList", response.getReturnValue());
                        }
                        else
                        {
                        if(param == 'Watch__c'){
                         alert('27');
                        console.log('teacher');
                        component.set('v.Listofrecords', [
                      {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Owner', fieldName: 'Owner_Name__c', type: 'text'},
            {label: 'Phone', fieldName: 'Phone_No__c', type: 'Phone'},
            {label: 'Date of Purchase', fieldName: 'Date_of_Purchase__c', type: 'date'},
            {label: 'Locality', fieldName: 'Address__c', type: 'text'}, 
                    {label: 'Store', fieldName: 'Store__c', type: 'picklist'},]);
                    component.set("v.studentlist", response.getReturnValue());
                    console.log('studentlist is '+studentlist);
                    component.set("v.schoolrecList", response.getReturnValue());
                }
            }
                               });
            $A.enqueueAction(action);
        }
    },
    gettingid: function(component, event, helper)
    {
        var action = event.getParam('action');
        var row = event.getParam('row');
        var altr=row.Id;
        var parameter=component.set("v.teacherrecord", teacherrec);
        console.log("parameter is",+parameter);
        component.set("v.parameter", false);
        component.set("v.DetailPage", true);
        console.log("details page is",+DetailPage);
    }
})