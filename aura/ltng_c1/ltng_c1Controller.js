({
    show : function(component, event, helper) {
        var abc=component.get('c.Hello');
        abc.setCallback(this, function(response){
        var state=response.getState();
        if (state=="SUCCESS"){
            var xyz=response.getReturnValue();
            component.set("v.result",xyz);
                }           
            });
        $A.enqueueAction(abc);
    }
})