// ignore_for_file: unnecessary_brace_in_string_interps

class Predict {
  String? pathServerSide;
  String? pathClientSide;
  String? predictedLabel;
  String? index;
  List<dynamic>? about;
   
  Predict({this.pathServerSide, this.pathClientSide, this.predictedLabel, this.index, this.about});
  Predict.fromJson(Map<String, dynamic> json) {
    pathServerSide = json['filePathName'] as String;
    predictedLabel = json['predictedLabel'] as String;
    index = json['index'] as String;
    about = json['about'] as List<dynamic>;
  }
  @override
  String toString() {
    return 'File Path: ${pathServerSide}\nDisease: ${predictedLabel}\nIndex:${index}\nCauses: ${about?[0]}\nRemedy: ${about?[1]}';
  }
}
