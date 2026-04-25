//
//  WeatherService.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation

struct WeatherService {
    
    private let apiKey = "d5f1fc7218c783007518b12043821547"
    
    func fetchWeather() async throws -> Weather {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=\(apiKey)&units=metric"
        
        let url = URL(string: urlString)!

        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpsResponce = response as? HTTPURLResponse {
            print("Status code:", httpsResponce)
        }
        
        print("Data:", String(data: data, encoding: .utf8) ?? "")

        let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]

        let main = json["main"] as! [String: Any]
        let temp = main["temp"] as! Double

        let weatherArray = json["weather"] as! [[String: Any]]
        let firstWeather = weatherArray[0]

        let description = firstWeather["description"] as! String
        let icon = firstWeather["icon"] as! String

        return Weather(
            temperature: temp,
            description: description,
            icon: icon
        )
    }
}
