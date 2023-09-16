class AyahOfTheDay {
  final String? arText;
  final String? enTran;
  final String? surEnName;
  final int? surNumber;

  AyahOfTheDay({this.arText, this.enTran, this.surEnName, this.surNumber});

  factory AyahOfTheDay.fromJSON(Map<String, dynamic> json) {
    return AyahOfTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      surEnName: json['data'][2]['surah']['englishName'],
      surNumber: json['data'][2]['numberInSurah'],
    );
  }
}
