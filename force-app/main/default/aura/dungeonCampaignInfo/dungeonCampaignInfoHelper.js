({
    getUserCampaigns : function(component) {
        var action = component.get("c.getUserCampaigns");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.campaignRecords", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})