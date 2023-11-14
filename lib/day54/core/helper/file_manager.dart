import 'dart:convert';

import 'package:flutter/services.dart';

class FileManager{
  FileManager._getobject();
 static FileManager? objectFile;

  static FileManager get geyObject {
    if(FileManager.objectFile==null) FileManager.objectFile = FileManager._getobject();
    return FileManager.objectFile!;
  }

   Future<List> getFile({required String path}) async {
    final rowJosn = await rootBundle.loadString(path);

    return jsonDecode(rowJosn);
  }
}