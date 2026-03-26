({
    callMe : function(component, event, helper) {
        var evt=component.getEvent("abc");
        var name = component.get("v.Name");
        var phone = component.get("v.Phone");
        var industry = component.get("v.Industry");
        var action=component.get("c.method1");
        action.setParams({"Name":name,'Phone':phone,"Industry":industry});
        action.setCallback(this,function(response){
            var a = response.getReturnValue();
            component.set("v.recId",a);
            //alert(component.get("v.recId"));
            evt.setParams({"accId":a});
            evt.fire();
        });
        $A.enqueueAction(action);
    }
})