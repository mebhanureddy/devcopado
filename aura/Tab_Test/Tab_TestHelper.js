({
    loadData: function (cmp, event) {
        var tab = event.getSource();
        switch (tab.get('v.id')) {
            case 'accounts' :
                this.loadContacts(cmp ,tab.get('v.id'));
                break;
            case 'contacts' :
                this.loadContacts(cmp ,tab.get('v.id'));
                break;
            case 'case' :
                this.loadContacts(cmp ,tab.get('v.id'));
                break;
            case 'campaign' :
                this.loadContacts(cmp ,tab.get('v.id'));
                break;
        }
    },
    loadContacts : function(cmp ,target) {
        var action ;
        console.log(target);
        if(target==='accounts'){
            console.log(target);
            action = cmp.get("c.getAccounts");
        }
        if(target==='contacts'){
            action = cmp.get("c.getContacts"); 
        }
        if(target==='case'){
            action = cmp.get("c.getCases"); 
        }
        if(target==='campaign'){
            action = cmp.get("c.getCam");
        }
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('response');
                console.log(response.getReturnValue());
                cmp.set("v.obj", response.getReturnValue());
                
            }
        });
        $A.enqueueAction(action);
    }
    
})