({
    nextshow : function(component, event, helper) {
        var myId=component.get("v.myVal");
        if (myId=="ONE"){
            component.set("v.myVal","TWO");
            
        }
        else if(myId=="TWO"){
            component.set("v.myVal","THREE");
        }
    },
    previousshow : function(component, event, helper) {
        var myId=component.get("v.myVal");
        if(myId=="TWO"){
            component.set("v.myVal","ONE");
        }
        else if(myId=="THREE"){
            component.set("v.myVal","TWO");
        }
    },
    callMe : function(component, event, helper) {
        var acc=component.get("v.acc");
        var con=component.get("v.con");
        var opp=component.get("v.opp");
        alert('acc'+acc);
        alert('opp'+opp);
        alert('con'+con);
        var action=component.get("c.Invoke");
        action.setParams({'Acc':acc,'Con':con,'Opp':opp})
        action.setCallback(this,function(response){
            var State=action.getState();
            if(State=="SUCCESS"){
                 var result=response.getReturnValue();
            component.set("v.recId",result);
            console.log("Result",result);
            }
            else{
                console.log('Failed');
            }
        });
        $A.enqueueAction(action);
    }
})