class AppConfig {
   
    static final AppConfig _instance = AppConfig._internal();
    factory AppConfig() => _instance;

    AppConfig._internal();


    String _apiUrl = "https://api.example.com/"; // Base URL for the API

    String get apiUrl => _apiUrl; // Getter for the API URL

}