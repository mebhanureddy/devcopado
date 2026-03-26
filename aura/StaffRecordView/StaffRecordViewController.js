({
    doInit : function(component){
        
        // Get a reference to the getWeather() function defined in the Apex controller
        var action = component.get("c.getStaffRecord");
        action.setParams({
            "staffId": component.get("v.recordId")
        });
        // Register the callback function
        action.setCallback(this, function(response){
            // Set the component attributes using values returned by the API call
            if (response.getState() == 'SUCCESS') {
                var staff=response.getReturnValue();
                
                component.set("v.staff", staff);
                component.set("v.isEditMode", false);
            }
        });
        // Invoke the service
        $A.enqueueAction(action);
    },
    
    handleStaffEvent : function(component, event) {
        var recId = event.getParam("recordId");
        // set the handler attributes based on event data
        component.set("v.recordId", recId);

        var action = component.get('c.getStaffRecord');
        
        action.setParams({"staffId": recId});
        
        action.setCallback(this, function(response){
            
            if (response.getState() == 'SUCCESS') {
                
                
                var staff=response.getReturnValue()
                component.set("v.staff", staff);
                
                component.set("v.isEditMode", false);
            }
        });
        $A.enqueueAction(action);   
       
    },
    editStaff : function(component){        
        component.set("v.isEditMode",true);
    },
    cancelPage : function(component){        
        component.set("v.isEditMode",false);
    },    
    saveStaff : function(component, event, helper){
        // Get a reference to the updateRecord() function defined in the Apex controller
        //getting the staff information
        var staff = component.get("v.staff");       
        
        //Make field required from front end (Not from DB)
        if(staff.Last_Name__c==''){
            alert('Missing Last name');
            return false;
        }
        
        
        var action = component.get("c.updateRecord");
        action.setParams({
            staff : staff
        });
        // Register the callback function
        action.setCallback(this, function(response){
            var state = response.getState();
            
            // Set the component attributes using values returned by the API call
            if (state == "SUCCESS") {
                    
                component.set("v.staff", staff);
                
                component.set("v.isEditMode", false);
               
            }else if(state == "ERROR"){
                //errors coming from DB thrown by controler catch blocl
                let errors = response.getError();
                let message;
                // Retrieve the error message sent by the server
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    message = errors[0].message;
                }
                
                alert(message);
            }
        });
        // Invoke the service
        $A.enqueueAction(action);
    },
    
    delStaff : function(component, event, helper){
        // Get a reference to the updateRecord() function defined in the Apex controller
        //getting the staff information
        var staff = component.get("v.staff");        
        var action = component.get("c.deleteRecord");
        action.setParams({
            staff : staff
        });
        
        // Register the callback function
        action.setCallback(this, function(response){
            // Set the component attributes using values returned by the API call
            if (response.getState() == 'SUCCESS') {
                component.set("v.staff", staff);
                component.set("v.isEditMode", false);
            }
        });
        
        
        // Invoke the service
        $A.enqueueAction(action);
        alert("Record is deleted.");
        
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/a00/o"
        });
        
        urlEvent.fire();
    }
})