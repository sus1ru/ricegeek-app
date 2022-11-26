// import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rice_geek/models/predict_model.dart';

class DiseaseAbout extends StatelessWidget {
  const DiseaseAbout({Key? key}) : super(key: key);
  static const routeName = '/diseaseAbout';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    File? theImage = routeArgs['theImage'];
    Predict? prediction = routeArgs['prediction'];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black26),
            // width: 400,
            child: (theImage != null)
                ? Image.file(
                    theImage,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    'https://i.postimg.cc/bYCWXBmg/gto-squat-small.png'),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    prediction!.predictedLabel!.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      const Text(
                        "CAUSES",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        prediction.about![0],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "REMEDY",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        prediction.about![1],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "DETAIL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // print(theImage.path + prediction.toString());
    // return Container(
    //   padding: const EdgeInsets.all(32.0),
    //   color: Colors.white,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: const <Widget>[
    //       SizedBox(height: 30.0),
    //       Text(
    //         "CAUSES",
    //         style: TextStyle(
    //           fontWeight: FontWeight.w600,
    //           fontSize: 14.0,
    //         ),
    //       ),
    //       SizedBox(height: 10.0),
    //       Text(
    //         "Lauda",
    //         textAlign: TextAlign.justify,
    //         style: TextStyle(
    //           fontWeight: FontWeight.w300,
    //           fontSize: 14.0,
    //         ),
    //       ),
    //       SizedBox(height: 16.0),
    //       Text(
    //         "REMEDY",
    //         style: TextStyle(
    //           fontWeight: FontWeight.w600,
    //           fontSize: 14.0,
    //         ),
    //       ),
    //       SizedBox(height: 10.0),
    //       Text(
    //         "Lasun",
    //         textAlign: TextAlign.justify,
    //         style: TextStyle(
    //           fontWeight: FontWeight.w300,
    //           fontSize: 14.0,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
