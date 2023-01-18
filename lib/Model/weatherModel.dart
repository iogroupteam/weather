class WeatherModel {
    WeatherModel({
        this.name,
        this.weeklyWeather,
    });

    String? name;
    List<WeeklyWeather?>? weeklyWeather;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        name: json["name"],
        weeklyWeather: json["weekly_weather"] == null ? [] : List<WeeklyWeather?>.from(json["weekly_weather"]!.map((x) => WeeklyWeather.fromJson(x))),
    );

}

class WeeklyWeather {
    WeeklyWeather({
        this.mainTemp,
        this.mainWind,
        this.mainHumidity,
        this.mainImg,
        this.day,
        this.allTime,
    });

    String? mainTemp;
    String? mainWind;
    String? mainHumidity;
    String? mainImg;
    String? day;
    AllTime? allTime;

    factory WeeklyWeather.fromJson(Map<String, dynamic> json) => WeeklyWeather(
        mainTemp: json["main_temp"],
        mainWind: json["main_wind"],
        mainHumidity: json["main_humidity"],
        mainImg: json["main_img"],
        day: json["day"],
        allTime: AllTime.fromJson(json["all_time"]),
    );


}

class AllTime {
    AllTime({
        this.hour,
        this.wind,
        this.img,
        this.temps,
    });

    List<String?>? hour;
    List<String?>? wind;
    List<String?>? img;
    List<String?>? temps;

    factory AllTime.fromJson(Map<String, dynamic> json) => AllTime(
        hour: json["hour"] == null ? [] : json["hour"] == null ? [] : List<String?>.from(json["hour"]!.map((x) => x)),
        wind: json["wind"] == null ? [] : json["wind"] == null ? [] : List<String?>.from(json["wind"]!.map((x) => x)),
        img: json["img"] == null ? [] : json["img"] == null ? [] : List<String?>.from(json["img"]!.map((x) => x)),
        temps: json["temps"] == null ? [] : json["temps"] == null ? [] : List<String?>.from(json["temps"]!.map((x) => x)),
    );

   
}

