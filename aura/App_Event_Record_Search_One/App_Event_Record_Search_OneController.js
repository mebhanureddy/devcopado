({
    doinit: function(component, event, helper) {
        var action=component.get("c.acclist");
        component.set("v.flag",true);
        component.set('v.columns', [
            {label: 'Accounts', fieldName: 'Name', type: 'text',},
            {label: 'Id',  type: 'button', typeAttributes: {label: { fieldName: 'Id' },variant:'Base'}}
        ]); 
        action.setCallback(this,function(response){
            component.set("v.data",response.getReturnValue());
            //alert(JSON.stringify(response.getReturnValue()));
            console.log(component.get("v.data"));
        });
        $A.enqueueAction(action);
    },
    search : function(component, event, helper) {
        var searchParam= component.get("v.searchParam");
        component.set("v.flag",true); 
        var action=component.get("c.acclist");
        action.setParams({
            param : searchParam
        });
        action.setCallback(this,function(response){
            component.set("v.data",response.getReturnValue());
            //alert(JSON.stringify(component.get("v.data")));
            console.log(component.get("v.data"));
        });
        
        $A.enqueueAction(action);
    },
    show: function(component, event, helper){
        var row = event.getParam('row');
        var rowid=row.Id;
        //alert(rowid);
        component.set("v.accid",rowid);
        var appEvent = $A.get("e.c:App_Event_ACC_Record_Search");
        appEvent.setParams({
            "accId" : rowid  });
        appEvent.fire();
    }
})