import Cocoa
import Foundation

func main(){
    let retriever = WeatherRetriever()
    let arguments = NSProcessInfo.processInfo().arguments as String[]
    if(arguments.count < 2){
        println("You need to pass the zipcode to the app")
        return
    }
    let weather = retriever.getWeather(arguments[1])
    println("The current temperature in \(weather.city) is: \(weather.temperature) F. Weather is: \(weather.description)")
}

main()
