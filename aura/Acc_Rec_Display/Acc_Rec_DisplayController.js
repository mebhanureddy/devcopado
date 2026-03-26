({
   doInit : function( component, event, helper ){  
       var action = component.get('c.getAccRec');
       action.setCallback(this, function(r){
           component.set("v.acclist", r.getReturnValue());    
       });
       $A.enqueueAction(action);
   }
})