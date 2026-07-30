import 'package:hive_flutter/adapters.dart';
class hive {
  var box = Hive.box("verified");
  void setval(){
    box.put("isverified", true);
  }

  bool value() {
    if (box.get("isverified") == null) {
      box.put("isverified", false);
      return false;
    } else {
      return box.get("isverified");
    }
  }

  int idx() {
    if (box.get("idx") == null) {
      box.put("idx", 0);
      return box.get("idx");
    } else {
      return box.get("idx");
    }
  }

  void setidx(int index) {
    box.put("idx", index);
  }


  int getpg() {
    if(box.get("pg")==null){
       box.put("pg", 1);
       return box.get("pg");
    }
    return box.get("pg");
  }
  void setpg(int pg) {
     box.put("pg", pg);
  }
  void close(){
    box.close();
  }
  }
