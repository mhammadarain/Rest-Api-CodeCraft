import 'dart:convert';
import 'dart:typed_data'; // Import this
import 'package:http/http.dart' as http;

class ApiImageServices {
  Future<dynamic> uploadImage(Uint8List bytes, String filename) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://api.escuelajs.co/api/v1/files/upload"),
    );

    var multipartFile = http.MultipartFile.fromBytes(
      "file",
      bytes,
      filename: filename,
    );

    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}
