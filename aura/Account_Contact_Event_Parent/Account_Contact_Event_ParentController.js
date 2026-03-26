({
    show : function(component, event, helper) {
        var recid= event.getParam("accId");
        component.set("v.recordid",recid);
        component.set("v.flag",true);
        
    },
    callMe: function(component, event, helper){
        var action=component.get("c.Cmethod");
        var lastname = component.get("v.LastName");
        var phone = component.get("v.Phone");
        var accid=component.get("v.recordid");
        action.setParams({
            "AccId" : accid,"LastName":lastname,'Phone':phone
        });
        action.setCallback(this,function(response){
            component.set("v.contactid",response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})