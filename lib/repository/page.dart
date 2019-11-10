import 'package:wadone_main/driver/page_driver.dart';
import 'page_memory.dart';

const dataSource = 'memory';

class PageRespository {
  final _pageDriver = PageDriver();
  final _pageMemory = PageMemory();

  Future getpage({String query}) {
    switch (dataSource) {
      case 'memory':
        return _pageMemory.getPage();
        break;
      case 'db':
        return _pageDriver.getPage();
        break;
      default:
        return _pageMemory.getPage();
    }
  }

  Future addPage() {
    switch (dataSource) {
      case 'memory':
        return _pageMemory.addPage();
        break;
      case 'db':
        return _pageDriver.addPage();
        break;
      default:
        return _pageMemory.addPage();
    }
  }
  
  Future clearPage() {
    switch (dataSource) {
      case 'memory':
        return _pageMemory.clearPage();
        break;
      case 'db':
        return _pageDriver.clearPage();
        break;
      default:
        return _pageMemory.clearPage();
    }
  }
}