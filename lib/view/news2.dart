import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relosnews/Features/toast.dart';
import 'package:relosnews/Model/apiclass.dart';
import 'package:relosnews/Services/api_service.dart';
import 'package:relosnews/view/detailscreen.dart';
import 'package:relosnews/viewmodel/hive.dart';
import 'package:toastification/toastification.dart';

class Newsscreen22 extends StatefulWidget {
  final int pg;
  final int idx;

  const Newsscreen22({
    super.key,
    required this.idx,
    required this.pg,
  });

  Future<api_service> fetchData() async {
    return await api_service_Services().fetchdata(pg);
  }

  @override
  State<Newsscreen22> createState() => _Newsscreen22State();
}

class _Newsscreen22State extends State<Newsscreen22> {
  late Future<api_service> news;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    print("news2 called");

    news = widget.fetchData();

    timer = Timer(const Duration(seconds: 15), () {
      if (mounted) {
        tst(
          context,
          "Try after sometime, Network Error",
          ToastificationType.error,
        );

        SystemNavigator.pop();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<api_service>(
        future: news,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            timer?.cancel();

            return Center(
              child: Text(
                "Error : ${snapshot.error}",
              ),
            );
          }

          if (snapshot.hasData) {
            timer?.cancel();

            final data = snapshot.data!;
            final article = data.articles!;

            print(data);
            print("length is ${article.length}");

            hive().setpg(widget.pg);

            return detail(
              article: article,
              index: widget.idx,
              pg: widget.pg,
            );
          }

          return const Center(
            child: Text("No Data Found"),
          );
        },
      ),
    );
  }
}