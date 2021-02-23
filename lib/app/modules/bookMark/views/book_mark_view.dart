import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_mark_controller.dart';

class BookMarkView extends GetView<BookMarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMarkView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookMarkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
