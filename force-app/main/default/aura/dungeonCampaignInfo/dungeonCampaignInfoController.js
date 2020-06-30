({
    doInit : function(component, event, helper) {
        helper.getUserCampaigns(component);
    },
    handleSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Your campaign has been updated!"
        });
        toastEvent.fire();
    }
})