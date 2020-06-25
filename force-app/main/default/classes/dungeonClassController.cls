public class dungeonClassController {
    
    static String baseUrl = 'https://www.dnd5eapi.co/api/classes/';

    @AuraEnabled
    public static Object[] getClasses(){
        Http h = new Http();
        HttpRequest classNameRequest = new HttpRequest();
        classNameRequest.setEndpoint(baseUrl);
        classNameRequest.setMethod('GET');

        HttpResponse classResponse = h.send(classNameRequest);
        Map<String, Object> nameResults = (Map<String, Object>) JSON.deserializeUntyped(classResponse.getBody());
        
        Object[] classes = new Object[]{};
        HttpRequest classInformation = new HttpRequest();
        for(Object result : (List<Object>) nameResults.get('results')) {
            Map<String,Object> data = (Map<String,Object>) result;
            classInformation.setEndpoint(baseUrl + data.get('index'));
            classInformation.setMethod('GET');
            HttpResponse informationResponse = h.send(classInformation);
            Map<String, Object> informationResults = (Map<String, Object>) JSON.deserializeUntyped(informationResponse.getBody());
            
            System.debug(informationResults);
            classes.add(informationResults);
        }
        
        return classes;
    }
}