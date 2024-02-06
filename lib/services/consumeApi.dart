part of 'services.dart';


class ConsumeApi extends ChangeNotifier{
  
Future<void> insertRecord(String title, String descript) async{
  String apiBase = "http://localhost:8888/api_taskmanagement/insert_record.php";
    try{
      var res = await http.post(Uri.parse(apiBase), body: {
        "title" : title,
        "description" : descript
      });
    
    var response = jsonDecode(res.body);
    if(response["success"]=="true"){
      print ("Data berhasil di simpan");
    }else{
      print ("Data gagal di simpan");
    }
    }catch(e){
      print(e);
    }
  
}

Future<List> getRecord()async{
   String apiBase = "http://localhost:8888/api_taskmanagement/view_data.php";
   List record = [];
   try{
    var response = await http.get(Uri.parse(apiBase));
    record = jsonDecode(response.body);
   }catch (e){
    print(e);
   }
 return record;
}

Future<void> deletedRecord(String id) async{
  try{
    String api = "http://localhost:8888/api_taskmanagement/delete_data.php?id=$id";
    var res = await http.delete(Uri.parse(api));
    var response = json.decode(res.body);
    if(response["success"]=="true"){
      print ("Data berhasil di Delete");
      
    }else{
      print ("Data gagal di Delete");
    }
  }catch (e){
    print(e);
  }
}

Future<void> updateRecord(String id, String title, String deskripsi) async{
 try{
   
String api = "http://localhost:8888/api_taskmanagement/update_data.php";
   DateTime date = DateTime.now();
    final res = await http.post(Uri.parse(api),
    body: {
          "id": id,
          "title": title,
          "description" : deskripsi,
    }); 

    if(res.statusCode == 200){
    var response = jsonDecode(res.body);
    if(response["success"]=="true"){
      print ("Data berhasil di Update");      
    }else{
      print ("Data gagal di Update");
    }
    }else{
      print('Gagal menghubungi server. Status code: ${res.statusCode}');
    }

   
    
  }
  catch (e){
    print(e);
  }
}
}
