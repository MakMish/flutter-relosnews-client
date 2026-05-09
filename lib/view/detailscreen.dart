import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:relosnews/view/aiscreen.dart';
import 'package:relosnews/viewmodel/url_launcher.dart';
import 'package:toastification/toastification.dart';
class detail extends StatelessWidget {
  List article;
  var index;
  detail({super.key,required this.article,required this.index});

  @override
  Widget build(BuildContext context) {
    var v=article.length;
    var x= article[index].url;
      return Scaffold(
        body:Container(
          padding: EdgeInsetsGeometry.all(15),
          child: Stack(
            children: [
              // 1. Background Image (Poori screen par)
              Positioned.fill(
                child: Image.network(
                  "${article[index].urlToImage}",
                  fit: BoxFit.cover, //
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image, size: 50)),
                ),
              ),
              Positioned(
                bottom: 60, // Bottom se thoda upar
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    print("explore caleed");
                    lnch(article[index].url);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        article[index].title ?? "No Title",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: (){
                          lnch(article[index].url.toString());
                        }
                        ,
                        child: const Text(
                          "EXPLORE NOW",
                          style: TextStyle(
                            color: Colors.white70,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(child: Column(
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (index > 0) {
                              // Option A: Agar naye page par jana hai (pichli news ke saath)
                              Get.to(
                                    () =>
                                    detail(article: article, index: index - 1),
                                transition: Transition.leftToRightWithFade,
                                // Reverse animation
                                preventDuplicates: false,
                              );

                            } else {
                              toastification.show(
                                context: context,
                                type: ToastificationType.info,
                                title: const Text('This is the first news'),
                              );
                            }
                          }
                          ,child: CircleAvatar(
                            radius: 35,
                            child:Icon(Icons.arrow_circle_left_rounded),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (index >= v - 1) {
                              toastification.show(
                                context: context,
                                type: ToastificationType.warning,
                                style: ToastificationStyle.flat,
                                autoCloseDuration: const Duration(seconds: 3),
                                title: const Text('News session ended for today'),
                              );
                            }
                            else {
                            Get.to(
                            ()=>detail(article: article, index: index+1), transition: Transition.rightToLeftWithFade,
                            preventDuplicates: false
                            );
                            }
                          },
                          child: CircleAvatar(
                            radius: 35,
                            child:Icon(Icons.arrow_circle_right_rounded),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.to(aiscreen(text: article[index].url));
        },child: Text("AI"),),
      );

  }
}
