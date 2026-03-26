({
    show : function(component, event, helper) {
        console.log("sdfsd");
        var conn = component.get("v.cont");
        
        var action= component.get("c.Invoke");
        action.setParams({
            con:conn
        });
        action.setCallback(this, function(response){
            var result= response.getReturnValue();
            component.set("v.recId",result);
            console.log('result'+result);
        });
        $A.enqueueAction(action);
    }
})