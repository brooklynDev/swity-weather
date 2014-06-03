import Cocoa
import Foundation

class WeatherRetriever{
    func getWeather(zipCode: String) -> Weather{
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(zipCode)&units=imperial"
        let request = NSURLRequest(URL: NSURL(string: url))
        var response: AutoreleasingUnsafePointer<NSURLResponse?> = nil
        var error: NSErrorPointer!
        let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)
        
        let result = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        let city = result["name"] as String
        let description = ((result["weather"] as NSArray)[0] as NSDictionary)["description"] as String
        let temperature = (result["main"] as NSDictionary)["temp"] as Float
        return Weather(temperature: temperature, description: description, city:city)
        
    }
    
}