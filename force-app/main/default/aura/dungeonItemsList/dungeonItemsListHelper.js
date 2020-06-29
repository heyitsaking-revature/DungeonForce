({
	setItems : function(component) {
        var itemType = component.get("v.isWeapons");
        var action = component.get("c.getCategoryItems");
        var weaponTypes;
        if(itemType) {
            setTimeout(function() {
                weaponTypes = component.get("v.items")
            }, 1000);
        } else {
            
        }
	}
})