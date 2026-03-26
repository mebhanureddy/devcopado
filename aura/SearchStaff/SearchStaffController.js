({
    Search: function(component, event, helper) {
        
        component.set("v.isNew",false);
        var searchKeyFld = component.find("searchId");
        var srcValue = searchKeyFld.get("v.value");
        if (srcValue == '' || srcValue == null) {
            // display error message if input value is blank or null
            searchKeyFld.set("v.errors", [{
                message: "Enter Search Keyword."
            }]);
        } else {
            searchKeyFld.set("v.errors", null);
            // call helper method
            helper.SearchHelper(component, event);
        }
    },
    navigateToStaff : function(component, event, helper) { 
        
        component.set("v.isNew",false);
        component.set("v.isView",true);
        component.set("v.objId",event.target.id); 
        component.set("v.headerText","My Staff");
        
        // Get the application event by using the
        // e.. syntax
        var appEvent = $A.get("e.c:staffViewCompEvent");
        appEvent.setParams({"recordId" : event.target.id});
        appEvent.fire();
        
    } ,
    createNew : function(component){ 
        component.set("v.headerText","New Staff");
        component.set("v.isNew",true);
        component.set("v.isView",false);
        
    },
    searchShow : function(component){ 
        component.set("v.headerText","Search Staff");
        component.set("v.isNew",false);
        component.set("v.isView",false);
        
    }
    
})