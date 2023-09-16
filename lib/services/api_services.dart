import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/ayah_of%20_the_day.dart';

class ApiServices {
  Future<AyahOfTheDay> getAyahOfTheDay() async {
    // for random ayah we need to generate random ayah number
    // 1 minimum ayah number and 6237 max
    String url =
        'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    // print(response.body);

    if (response.statusCode == 200) {
      return AyahOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print('Failed to Load');
      throw Exception('Failed to Load Post');
    }
  }

  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }
}
