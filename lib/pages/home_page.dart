import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  final Weather weather;

  HomePage({Key key, this.weather}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String emoji = '';

  @override
  void initState() {
    print('init');
    print(widget.weather);
    switch (widget.weather.main) {
      case 'Clouds':
        emoji = '☁';
        break;

      case 'Rain':
        emoji = '🌧️';
        break;

      case 'Sun':
        emoji = '☀';
        break;

      case 'Heat':
        emoji = '🔥';
        break;

      case 'Thunderstorm':
        emoji = '⛈';
        break;

      default:
        emoji = '🤷';
    }

    super.initState();
  }

  bool isKelvins = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 1),
      builder: (_, double value, __) {
        return AnimatedOpacity(
          opacity: value,
          duration: Duration(seconds: 1),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width,
                  height: size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              urlImageAdress[widget.weather.main] ??
                                  urlImageAdress['Regular']),
                          fit: BoxFit.fill)),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(77, 77, 77, 0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${widget.weather.main} $emoji',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '${widget.weather.town}, ${widget.weather.country}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${widget.weather.temperature.round()}°${isKelvins ? 'K' : 'C'}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text(isKelvins ? 'To Celsius' : 'To Kelvins'),
                  onPressed: () {
                    setState(() {
                      widget.weather.temperature = toAnotherTemp(
                          temp: widget.weather.temperature,
                          isKelvins: isKelvins);
                      isKelvins = !isKelvins;
                    });
                  },
                ),
                Text(
                  'More details: ${widget.weather.description}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Wind speed: ${widget.weather.windSpeed} m/s',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pressure: ${toMillimetreOfMercury(pressure: widget.weather.pressure)} millimetre of mercury',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Humidity: ${widget.weather.humidity} %',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Cloudiness  : ${widget.weather.cloudiness} %',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/loading');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
