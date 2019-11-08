import 'pagedatasorce.dart';

class PageMemory {
  PageMemory() {
    initPages();
  }
  Future initPages() async {
    dataList.clear();
  }

  Future<List> getPages() async {
    return dataList;
  }

  Future<int> addPage() async {

  }

  Future clearPages() async {
  }
}