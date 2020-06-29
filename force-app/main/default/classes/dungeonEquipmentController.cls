public class dungeonEquipmentController {
    
    static String baseUrl = 'https://www.dnd5eapi.co/api/equipment-categories/';
    static String equipmentUrl = 'https://www.dnd5eapi.co/api/equipment/';
    
    @AuraEnabled
    public static Object[] getWeaponTypes(){
        Http h = new Http();
        HttpRequest weaponTypesRequest = new HttpRequest();
        weaponTypesRequest.setEndpoint(baseUrl);
        weaponTypesRequest.setMethod('GET');
        
        HttpResponse weaponTypesResponse = h.send(weaponTypesRequest);
        Map<String, Object> weaponTypesResults = (Map<String, Object>) JSON.deserializeUntyped(weaponTypesResponse.getBody());
        
        Object[] weaponTypes = new Object[]{};
            
            for(Object result : (List<Object>) weaponTypesResults.get('results')) {
                Map<String,Object> curEquipmentCat = (Map<String,Object>) result;
                String equipmentCatName = (String) curEquipmentCat.get('index');
                if(equipmentCatName.contains('melee-weapons') || equipmentCatName.contains('ranged-weapons')){
                    system.debug(equipmentCatName);
                    weaponTypes.add(result);
                }
            }
        return (List<Object>) weaponTypes;
    }
    
    @AuraEnabled
    public static Object[] getArmorTypes(){
        Http h = new Http();
        HttpRequest armorTypeRequest = new HttpRequest();
        armorTypeRequest.setEndpoint(baseUrl);
        armorTypeRequest.setMethod('GET');
        
        HttpResponse armorTypeResponse = h.send(armorTypeRequest);
        Map<String, Object> armorTypeResults = (Map<String, Object>) JSON.deserializeUntyped(armorTypeResponse.getBody());
        
        Object[] armorTypes = new Object[]{};
            
            for(Object result : (List<Object>) armorTypeResults.get('results')) {
                Map<String,Object> curEquipmentCat = (Map<String,Object>) result;
                String equipmentCatName = (String) curEquipmentCat.get('index');
                if(equipmentCatName.contains('-armor')){
                    armorTypes.add(result);   
                }
            }
        
        Object heavy = armorTypes.get(0);
        armorTypes.remove(0);
        armorTypes.add(heavy);
        
        return (List<Object>) armorTypes;
        
    }
    
    @AuraEnabled
    public static Object[] getCategoryItems(String index){
        Http h = new Http();
        HttpRequest categoryInfoRequest = new HttpRequest();
        categoryInfoRequest.setEndpoint(baseUrl + index);
        categoryInfoRequest.setMethod('GET');
        
        HttpResponse categoryInfoResponse = h.send(categoryInfoRequest);
        Map<String, Object> categoryInfoResults = (Map<String, Object>) JSON.deserializeUntyped(categoryInfoResponse.getBody());
        
        Object[] items = new Object[]{};
            
            HttpRequest itemInfoRequest = new HttpRequest();
        for(Object result : (List<Object>) categoryInfoResults.get('equipment')) {
            Map<String, Object> item = (Map<String, Object>) result;
            String itemUrl = (String) item.get('url');
            itemInfoRequest.setEndpoint(equipmentUrl + itemUrl.substring(itemUrl.lastIndexOf('/') + 1));
            itemInfoRequest.setMethod('GET');
            
            HttpResponse itemInfoResponse = h.send(itemInfoRequest);
            Map<String,Object> itemInfoResults = (Map<String,Object>) JSON.deserializeUntyped(itemInfoResponse.getBody());
            Map<String, Object> relevantData = new Map<String, Object>();
            relevantData.put('name', itemInfoResults.get('name'));
            if(index.contains('weapon')) {
                relevantData.put('damage', itemInfoResults.get('damage'));
                relevantData.put('twoH_damage', itemInfoResults.get('2h_damage'));
                relevantData.put('cost', itemInfoResults.get('cost'));
                relevantData.put('weight', itemInfoResults.get('weight'));
                List<Object> properties = (List<object>) itemInfoResults.get('properties');
                try {
                    for(Object prop: properties) {
                        Map<String, Object> propValues = (Map<String, Object>) prop;
                        if(propValues.get('name') == 'Versatile') {
                            relevantData.put('versatile', true);
                        }
                    }
                } catch(Exception e) {
                    system.debug(e.getMessage());
                } finally {
                    items.add(relevantData);
                }
            } else {
                items.add(itemInfoResults);
            }
        }
        return (List<Object>) items;
    }
}