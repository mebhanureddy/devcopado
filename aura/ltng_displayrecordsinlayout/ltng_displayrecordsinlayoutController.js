({
    show : function(component, event, helper) {
        var columns=[{label:'Name',fieldName:'Name',type:'text',iconName: 'standard:account'},
                     {label:'Phone',fieldName:'Phone',type:'tel'},
                     {label:'Industry',fieldName:'Industry',type:'text'},
                     {label:'Rating',fieldName:'Rating',type:'text'},
                     {label:'View',type:'button',typeAttributes: { label: 'View',name: 'view'}},
                     {label:'Edit',type:'button',typeAttributes: { label: 'Edit',name: 'edit'}}];
        var action = component.get("c.AccDisplay");
        component.set("v.columns",columns);
        action.setCallback(this,function(res){
            var result=res.getReturnValue();
            component.set("v.data",result);
        });
        $A.enqueueAction(action);
    },
    view : function(component, event, helper) {
        var row=event.getParam('row');
        var action=event.getParam('action');
        var rowid=row.Id;
        //alert(rowid);
        component.set('v.recId',rowid);
        component.set('v.flag',true);
        if(action.name=='view'){
            component.set('v.mode',"view");
        }else{
            component.set('v.mode',"edit");
        }
        //alert(component.get('v.mode'));
    }
})