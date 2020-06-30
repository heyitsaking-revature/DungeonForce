({
    doInit : function(component, event, helper) {
        helper.getUserCharacters(component);
    },
    handleSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Your character has been updated!"
        });
        toastEvent.fire();
    }
})