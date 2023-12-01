import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_node_store/models/product_model.dart';
import 'package:flutter_node_store/screens/products/components/product_form.dart';
import 'package:flutter_node_store/services/rest_api.dart';
import 'package:flutter_node_store/utils/utility.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  // สร้าง GlobalKey สำหรับฟอร์ม

  final _formKeyAddProduct = GlobalKey<FormState>();

  // สร้างตัวแปรสำหรับเก็บข้อมูล Product
  final _product = ProductModel(
    name: '',
    description: '',
    stock: 0,
    price: 0,
    categoryId: 1,
    userId: 1,
    statusId: 1,
  );

  // ไฟล์รูปภาพ
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ProductAdd"),
          actions: [
            //Save Button
            IconButton(
              onPressed: () async {
                if (_formKeyAddProduct.currentState!.validate()) {
                  _formKeyAddProduct.currentState!.save();
                  // Utility().logger.d(_product.toJson());
                  // Utility().logger.d(_imageFile);

                  var response = await CallAPI()
                      .addProductAPI(_product, imageFile: _imageFile);

                  var body = jsonDecode(response);

                  if (body['status'] == 'ok') {
                    // ปิดหน้าต่างแล้วกลับไปยังหน้าก่อนหน้า
                    Navigator.pop(context, true);
                  }
                }
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductForm(_product,
                  callBackSetImage: _callBackSetImage,
                  formKey: _formKeyAddProduct),
            ],
          ),
        ));
  }

  // ฟังก์ชั่นสำหรับเลือกรูปภาพ
  void _callBackSetImage(File? imageFile) {
    setState(() {
      _imageFile = imageFile;
    });
  }
}
