class WeatherDataDaily {
  List<Daily> daily;

  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDataDaily(
      daily: List<Daily>.from(
          json["daily"].map((e) => Daily.fromJson(e)).toList()),
    );
  }
}

class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  double? clouds;
  double? pop;
  double? uvi;
  double? rain;

  Daily(
      {this.dt,
      this.temp,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.rain});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'] as int?,
      temp: json['temp'] != null ? Temp.fromJson(json['temp']) : null,
      weather: json['weather'] != null
          ? List<Weather>.from(json['weather'].map((v) => Weather.fromJson(v)))
          : null,
      clouds: json['clouds']?.toDouble(),
      pop: json['pop']?.toDouble(),
      uvi: json['uvi']?.toDouble(),
      rain: json['rain']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.temp != null) {
      data['temp'] = this.temp!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this.clouds;
    data['pop'] = this.pop;
    data['uvi'] = this.uvi;
    data['rain'] = this.rain;
    return data;
  }
}

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day']?.toDouble(),
      min: json['min']?.toDouble(),
      max: json['max']?.toDouble(),
      night: json['night']?.toDouble(),
      eve: json['eve']?.toDouble(),
      morn: json['morn']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}
