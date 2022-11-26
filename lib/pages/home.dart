import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rice_geek/core/res/color.dart';
import 'package:rice_geek/models/image_select.dart';
import 'package:rice_geek/core/routes/routes.dart';
import 'package:rice_geek/widgets/circle_gradient_icon.dart';
import 'package:rice_geek/widgets/dialog_progress.dart';
import 'package:rice_geek/widgets/task_group.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? imageSource;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        // animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.photo_camera),
            onTap: () {
              imageSource = 'camera';
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.photo),
            onTap: () {
              imageSource = 'gallery';
            },
          ),
        ],
        onClose: () async {
          if (imageSource != null) {
            // setState(() {
            //   isLoading = true;
            // });
            showLoaderDialog(context);
            final dynamic routeArgs = await getImage(imageSource!);
            imageSource = null;
            Navigator.pop(context);
            if (routeArgs != null) {
              Navigator.pushNamed(
                context,
                Routes.diseaseAbout,
                arguments: routeArgs,
              );
            }
            // setState(() {
            //   isLoading = false;
            //   Navigator.pushNamed(
            //     context,
            //     Routes.diseaseAbout,
            //     arguments: routeArgs,
            //   );
            // });
          }
        },
      ),
      appBar: AppBar(
        title: Text(
          "Rice Geek",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleGradientIcon(
              onTap: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              icon: Icons.person,
              color: Colors.purple,
              iconSize: 24,
              size: 40,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.energy_savings_leaf),
            // InkWell(
            //   onTap: () {},
            //   customBorder: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: const Icon(
            //     Icons.energy_savings_leaf,
            //   ),
            // ),
          ),
        ),
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 15,
                ),
                buildGrid(),
                const SizedBox(
                  height: 25,
                ),
                _onGoingHeader(),
                const SizedBox(
                  height: 10,
                ),
                // const OnGoingTask(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _onGoingHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "On Going",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text(
            "Logout",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Total Predictions",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: TaskGroupContainer(
            color: Colors.pink,
            icon: Icons.menu_book_rounded,
            taskCount: 10,
            taskGroup: "BrownSpot",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.mobile_friendly,
            taskCount: 5,
            taskGroup: "Hispa",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: TaskGroupContainer(
            color: Colors.green,
            icon: Icons.article,
            taskCount: 2,
            taskGroup: "LeafBlast",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.single_bed_sharp,
            taskCount: 9,
            taskGroup: "Healthy",
          ),
        ),
      ],
    );
  }
}

// class OnGoingTask extends StatelessWidget {
//   const OnGoingTask({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(
//         20,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       width: 100.w,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: 60.w,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Startup Website Design with Responsive",
//                   style: TextStyle(
//                     color: Colors.blueGrey[700],
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.timelapse,
//                       color: Colors.purple[300],
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       "10:00 AM - 12:30PM",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 4,
//                     horizontal: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.purple[50],
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Text(
//                     "Complete - 80%",
//                     style: TextStyle(
//                       color: Colors.purple,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Icon(
//             Icons.rocket_rounded,
//             size: 60,
//             color: Colors.orange,
//           )
//         ],
//       ),
//     );
//   }
// }

// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();

//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);

//     final firstControlPoint = Offset(size.width * 0.6, 0);
//     final firstEndPoint = Offset(size.width * 0.58, 44);
//     path.quadraticBezierTo(
//       firstControlPoint.dx,
//       firstControlPoint.dy,
//       firstEndPoint.dx,
//       firstEndPoint.dy,
//     );

//     final secControlPoint = Offset(size.width * 0.55, 50);
//     final secEndPoint = Offset(size.width * 0.5, 50);
//     path.quadraticBezierTo(
//       secControlPoint.dx,
//       secControlPoint.dy,
//       secEndPoint.dx,
//       secEndPoint.dy,
//     );

// //     path.lineTo(size.width * 0.45, 30);

// //     final lastControlPoint = Offset(size.width * 0.45, 20);
// //     final lastEndPoint = Offset(size.width * 0.2, 30);
// //     path.quadraticBezierTo(
// //       lastControlPoint.dx,
// //       lastControlPoint.dy,
// //       lastEndPoint.dx,
// //       lastEndPoint.dy,
// //     );

//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
