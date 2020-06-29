public class dungeonClassController {
    
    static String baseUrl = 'https://www.dnd5eapi.co/api/classes/';

    @AuraEnabled
    public static String[] getClasses(){
        Http h = new Http();
        HttpRequest classNameRequest = new HttpRequest();
        classNameRequest.setEndpoint(baseUrl);
        classNameRequest.setMethod('GET');

        HttpResponse classResponse = h.send(classNameRequest);
        Map<String,Object> nameResults = (Map<String, Object>) JSON.deserializeUntyped(classResponse.getBody());
        
        String[] classes = new String[]{};
        HttpRequest classInformation = new HttpRequest();
        for(Object result : (List<Object>) nameResults.get('results')) {
            Map<String,Object> curClass = (Map<String,Object>) result;
            classes.add((String)curClass.get('name'));
        }
        
        return classes;
    }
    
    @AuraEnabled
    public static Object getClassInfo(String index){
        Http h = new Http();
        HttpRequest classNameRequest = new HttpRequest();
        classNameRequest.setEndpoint(baseUrl + index);
        classNameRequest.setMethod('GET');

        HttpResponse classInfoResponse = h.send(classNameRequest);
        Map<String, Object> infoResults = (Map<String, Object>) JSON.deserializeUntyped(classInfoResponse.getBody());
        
        return (Object) infoResults;
    }
}