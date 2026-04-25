# Weather Notes

iOS application for creating notes with current weather information.

## Overview
The app allows users to create notes and automatically attach current weather data (temperature, description, and icon) using OpenWeather API.

## Features
- Create notes with title and text
- Fetch current weather from OpenWeather API
- Display weather icon using SF Symbols
- View note details
- Persist notes locally using CoreData
- Notes are sorted by creation date (newest first)

## Tech Stack
- SwiftUI
- MVVM
- URLSession
- CoreData

## Setup
1. Get your API key from https://openweathermap.org/
2. Insert it into `WeatherService.swift`
3. Run the project

## Notes
- Weather is fetched for Kyiv (as per task requirement)
- Basic error handling is implemented for API requests

