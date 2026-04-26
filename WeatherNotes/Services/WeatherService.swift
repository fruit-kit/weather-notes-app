//
//  WeatherService.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation

struct WeatherService {
    
    private let apiKey = "d5f1fc7218c783007518b12043821547"
    
    func fetchWeather(city: String) async throws -> Weather {
        
        let trimmedCity = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let cityToUse = trimmedCity.isEmpty ? "Kyiv" : city
        
        guard let encodedCity = cityToUse.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw URLError(.badURL)
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity)&appid=\(apiKey)&units=metric"
        
        let url = URL(string: urlString)!

        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpsResponce = response as? HTTPURLResponse,
           httpsResponce.statusCode != 200 {
            throw URLError(.badServerResponse)
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
