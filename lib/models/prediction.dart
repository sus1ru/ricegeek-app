import 'dart:io';
import 'package:rice_geek/models/predict_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Predict> predictImage(File file) async {
  var request = http.MultipartRequest(
    // "POST", Uri.parse("https://plantfixapp.herokuapp.com/mldeploy/predict/"),
    "POST", Uri.parse("http://192.168.18.10:8000/mldeploy/predict/"),
  );
  //add text fields
  //request.fields["text_field"] = text;
  //create multipart using filepath, string or bytes
  var img = await http.MultipartFile.fromPath("image", file.path);
  print(file.path + "-----------------------------------------------------");
  //add multipart to request
  request.files.add(img);
  var response = await request.send();

  //Get the response from the server
  var responseData = await response.stream.toBytes();

  var responseString = String.fromCharCodes(responseData);
  Predict prediction = Predict.fromJson(jsonDecode(responseString));

  return prediction;
}
