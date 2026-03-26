({
    
    create : function(component, event, helper) {
        //getting the staff information
        var staff = component.get('v.staff');
        console.log("$$$$"+staff);
        //Make field required from front end (Not from DB)
        if(staff.Last_Name__c === "") 
           { 
            alert("Missing Last name");
            return false;
        }
         console.log("$$$$");
        
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            staff : staff
        });
        
        //Setting the Callback
        action.setCallback(this,function(response){
            //get the response state
            var state = response.getState();
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newstaff = {"sobjectType":"", "staff__c":"",'First_Name__c':"" ,
                                'Last_Name__c': "" ,'Email__c': "", 'Phone__c': "" ,'Start_Date__c':""
                               };
                //Resetting the Values in the form
                component.set("v.staff",newstaff);
                
                alert('Record is Created Sucessfully');
                
                var urlEvent = $A.get("e.force:navigateToURL");
                urlEvent.setParams({
                    "url":"/lightning/o/Staff_c/list?filterName=Recent&0.source=alohaHeader"
                });
                    console.log(urlEvent);
                    urlEvent.fire();
                    
                } else if(state == "ERROR"){
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
                    //adds the server-side action to the queue
                    $A.enqueueAction(action);
                    
                }
                })