import 'package:weather_app/weather_repository.dart';

Map<String, String> urlImageAdress = {
  'Clouds':
      'https://images.unsplash.com/photo-1536441459240-64d4b19e7c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
  'Regular':
      'https://s7d2.scene7.com/is/image/TWCNews/0801_n13_chuluotaweatherjpg?wid=2000&hei=1125&\$wide-bg\$',
  'Rain':
      'https://videohive.img.customer.envatousercontent.com/files/95176004/preview-Heavy%20Rain%20in%20Forest.png?auto=compress%2Cformat&fit=crop&crop=top&max-h=8000&max-w=590&s=148d97f8d732d4013ff296a943471a36',
  'Sun':
      'https://img1.goodfon.ru/wallpaper/nbig/c/e6/morning-sun-tree-forest-utro.jpg',
  'Heat':
      'https://cdn.pixabay.com/photo/2019/05/08/19/45/forest-4189479_960_720.jpg',
  'Thunderstorm':
      'https://www.stormgeo.com/assets/ArticleImages/_resampled/CroppedFocusedImageWzQyODgsMjcwMCwieSIsNzRd/thunderstorm-flipped.jpg',
  'Snow':
      'http://static-18.sinclairstoryline.com/resources/media/dd1ce355-1078-4f1b-8881-4f8eca22add0-large16x9_hurricane_ridge.jpg?1569850298519',
};

final Function toAnotherTemp =
    ({num temp, bool isKelvins}) => isKelvins ? temp - 273.15 : temp + 273.15;

final Function toMillimetreOfMercury =
    <num>({int pressure}) => (pressure * 100) * 0.0075;
