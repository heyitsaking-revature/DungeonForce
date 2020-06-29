({
    getSpellInfo : function(component) {
        var action = component.get("c.getSpellInfo");
        const regex = /[ ]/gi;
        try {
            action.setParams({"index": component.get("v.activeSections")[0].toLowerCase().replace(regex, "-")});
        } catch (e) {
            console.log(e);
        }
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                console.log(response);
                component.set("v.currentActiveSpell", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);		
    },
    setDefault: function(component) {
        var defaultSpell = {
            "level": "",
            "range": "",
            "casting-time": "",
            "material": "",
            "desc":[""]
        }
        component.set('v.currentActiveSpell', defaultSpell);
    }
})