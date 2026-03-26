({
    show : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Account Phone', fieldName: 'Phone', type: 'phone'},]);
            var action=component.get("c.callMe");
            action.setCallback(this,function(response){
            var result=response.getReturnValue();
            component.set("v.data",result);
            });
            $A.enqueueAction(action);
            }
            })