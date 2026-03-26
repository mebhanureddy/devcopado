({
    accshow: function(component, event, helper){
        var action=	component.get('c.acclist');
        action.setCallback(this,function(response){
            component.set('v.data',response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    conshow : function(component, event, helper) {
        var action=	component.get('c.conlist');
        action.setCallback(this,function(response){
            var result=response.getReturnValue();
            for(var i=0;i<result.length;i++){
                var res=result[i];
                if(res.Account){
                    res.AName=res.Account.Name;
                }
            }
            component.set('v.data',result);
        });
        $A.enqueueAction(action);
    },
    accrf: function(component, event, helper) {
        var row=event.getParam('row');
        var rowid=row.id;
        alert(JSON.stringify(rowid));
        component.set('v.flag',true);
        alert(component.get('v.flag'));
    }
})