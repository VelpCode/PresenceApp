import SwiftUI

struct ContentView: View {
    @State private var cityName: String = "London, ON"
    @State private var temperature: String = "--"
    @State private var weatherDescription: String = "Loading..."
    @State private var icon: String = "cloud.sun.fill"
    @State private var humidity: String = "--"
    @State private var windSpeed: String = "--"
    @State private var forecast: [WeatherDay] = []
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(cityName)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("\(temperature)°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text(weatherDescription)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Humidity: \(humidity)%")
                            .foregroundColor(.white)
                        Text("Wind: \(windSpeed) km/h")
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        ForEach(forecast) { day in
                            WeatherDayView(dayOfWeek: day.dayOfWeek, imageName: day.imageName, temperature: day.temperature)
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    print("Change Location Tapped")
                } label: {
                    Text("Change Location")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(8)
                        .shadow(radius: 3)
                }
                .padding(.bottom)
                
                TextField("Enter city name", text: $cityName, onCommit: {
                    fetchWeatherData(for: cityName)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            fetchWeatherData(for: cityName)
        }
    }
    
    func fetchWeatherData(for city: String) {
        // Simulating fetching data from an API
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Update these values with the real data
            self.temperature = "76"
            self.weatherDescription = "Partly Cloudy"
            self.icon = "cloud.sun.fill"
            self.humidity = "65"
            self.windSpeed = "15"
            self.forecast = [
                WeatherDay(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72),
                WeatherDay(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 78),
                WeatherDay(dayOfWeek: "THU", imageName: "wind.snow", temperature: 62),
                WeatherDay(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 71),
                WeatherDay(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 65)
            ]
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDay: Identifiable {
    var id = UUID()
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

#Preview {
    ContentView()
}
