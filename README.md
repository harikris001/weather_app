# Weather App


<img src="https://github.com/harikris001/weather_app/assets/85405666/90e8dff6-f4c6-42f5-9961-7e12ac3b16fd" alt="Screenshot" width="200">


The Weather App is a simple yet powerful application built using Flutter (v3.13.0) and the OpenWeather API. This app provides real-time weather and forecast data to keep you informed about the current and upcoming weather conditions. Whether you're planning your day or keeping an eye on the week's weather, the Weather App has you covered.

## Features

- Real-time weather updates
- 5-day forecast
- User-friendly interface
- Powered by the OpenWeather API

## Dependencies

The following dependencies were used to develop this app:

- **Flutter:** The framework used to create the app's user interface and logic.
- **http:** A package for making HTTP requests to the OpenWeather API and fetching weather data.
- **intl:** A Flutter package that provides internationalization and localization support.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/harikris001/weather_app.git
   ```

2. **Navigate to the project directory:**

   ```bash
   code weather-app
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

## Configuration

To use the OpenWeather API and fetch weather data, you'll need to sign up on the [OpenWeather website](https://openweathermap.org/) to obtain an API key. Once you have the API key, you can configure it in the app. Locate the `lib/sceret_key.dart` file and replace `'USE_API_FROM_OPEN_WEATHER'` with your actual API key.

```dart
const weatherApi = 'USE_API_FROM_OPEN_WEATHER';
```

## Video

https://github.com/harikris001/weather_app/assets/85405666/1900a63f-53c6-4f07-99fd-7a17ab1632de


## Contributions

Contributions to the Weather App are welcome! If you find any issues or want to add new features, feel free to open a pull request. Please make sure to follow the existing coding style and project structure.

## License

This project is licensed under the [MIT License](LICENSE).

---

Designed and developed with ❤️ by [Harikrishna R Nair](https://github.com/harikris001)


[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
