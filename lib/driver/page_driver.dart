import 'package:wadone_main/db/DatabaseProvider.dart';
import 'package:wadone_main/models/page.dart';
import 'package:wadone_main/repository/help.dart';
///uncomplete
///do data process
///data from help and models/page 
class PageDriver{
final dbProvider = DatabaseProvider.dbProvider;

  PageDriver(){
    initPage();
  }

  Future initPage() async{
  }

  Future<int> addPage() async {
    final db = await dbProvider.database;
    int total = await getTotal();
    Map<String, dynamic> randomJson = Helper.makeRandCatalog(total);
    var result = await db.insert(tableCatalog, randomJson);
    return result;
  }

  Future<List> getPage() async {
    final db = await dbProvider.database;
    var catalogList = List<Page>();
    List<Map> result = await data();
    catalogList = result.map((item) => Page.fromJson(item)).toList();
    return catalogList;
  }

  Future<int> getTotal() async {
    final db = await dbProvider.database;
    var result =
        await db.rawQuery("SELECT COUNT(id) as Total FROM $tableCatalog");
    return result[0]['Total'];
  }

  data (){
    ///db sorce
  }

  Future clearPage() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableCatalog,
    );
    return result;
  }


}