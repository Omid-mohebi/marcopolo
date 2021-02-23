import 'package:get/get.dart';

import '../controllers/book_mark_controller.dart';

class BookMarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookMarkController>(
      () => BookMarkController(),
    );
  }
}
