import '../services/location.dart';
import '../services/networking.dart';
const apiKey = '47103cb3ea13097b7b312566166837ca';
const url = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future <dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
        '$url?q=$cityName&appid=$apiKey&units=metric');
    var weatherData =await networkHelper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');


    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s hot Outside';
    } else if (temp > 20) {
      return 'It\'s sunny Outside';
    } else if (temp < 10) {
      return "It'c chilly outside";
    } else {
      return "It's going to be super cold";
    }
  }
}
