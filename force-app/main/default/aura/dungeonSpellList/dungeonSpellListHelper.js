({
    getSpellsList : function(component) {
        var action = component.get("c.getSpells");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.spells", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getInitials: function(component) {
        var action = component.get("c.getSpellInitials");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.initials", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getInitialSpells: function(component, event) {
        var initial = event.getSource().get("v.id");
        var allSpells = component.get("v.spells");
        var activeTabSpells = allSpells.filter(spell => {
            if(spell.substring(0,1) == initial) {
            	return spell;
        	}
        });
        component.set("v.activeTabSpells", activeTabSpells);
    }
})