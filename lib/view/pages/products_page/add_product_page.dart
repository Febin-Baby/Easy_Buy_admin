import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_admin_app/controller/product_adding/dropdown_controller.dart';
import 'package:easybuy_admin_app/controller/product_adding/product_image_controller.dart';
import 'package:easybuy_admin_app/controller/product_adding/varients_adding_controller.dart';
import 'package:easybuy_admin_app/model/add_product_model.dart';
import 'package:easybuy_admin_app/model/firebase_instance.dart';
import 'package:easybuy_admin_app/services/product_services/product_collection.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/image_part/add_image_big_container.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/image_part/image_show_mini_container.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/varient_type/dropdown_field.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/varient_type/varient_lists.dart';
import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';
import 'package:easybuy_admin_app/view/widgets/custom_button.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:easybuy_admin_app/view/widgets/textform_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const routename = '/AddProduct';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  ProductModel productModel = ProductModel();
  TextEditingController priceController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descrptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  CollectionReference brand = FirebaseInstances.firestore.collection('brands');
  final Map<String, String> brandDocID = {};
  final List<String> brandlist = [
    'Select Brand',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppbar(
        title: 'Add Product',
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
          stream: brand.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Loading(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              const Center(
                child: Text('No items here'),
              );
            }
            for (QueryDocumentSnapshot<Object?> brand in snapshot.data!.docs) {
              if (!brandlist.contains(brand['name'])) {
                brandlist.add(brand['name']);
                brandDocID[brand['name']] = brand.id;
              }
            }
            return ListView(
              children: [
                const Center(
                  child: Boldtext18(
                    text: "Select image from gallery",
                  ),
                ),
                Consumer<ProductImageController>(
                  builder: (context, productImagecontroller, child) {
                    productModel.imagelist = productImagecontroller.imagelist;
                    return Column(
                      children: [
                        ImageShower(imageController: productImagecontroller),
                        selectHieght(khieght * 0.04),
                        ImageAddingContainers(
                            productImagecontroller: productImagecontroller),
                      ],
                    );
                  },
                ),
                selectHieght(khieght * 0.04),
                const Text('Brand'),
                ChangeNotifierProvider(
                  create: (context) =>
                      DropdownController(item: brandlist, value: brandlist[0]),
                  child: Consumer<DropdownController>(
                    builder: (context, dropcontro, child) {
                      productModel.brand =
                          dropcontro.value == dropcontro.item[0]
                              ? ''
                              : brandDocID[dropcontro.value] ?? '';
                      return DropDownProductAdd(
                        dropDownController: dropcontro,
                      );
                    },
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TTextFormField(
                        text: 'Enter product name',
                        preffix: Icons.near_me,
                        controller: namecontroller,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter product price',
                        preffix: Icons.branding_watermark_sharp,
                        controller: priceController,
                        inputType: TextInputType.phone,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter product dicount',
                        preffix: Icons.branding_watermark_sharp,
                        controller: discountController,
                        inputType: TextInputType.phone,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter product Description',
                        preffix: Icons.description,
                        controller: descrptionController,
                        inputType: TextInputType.name,
                        obscureText: false,
                        maxlines: 4,
                      ),
                    ],
                  ),
                ),
                selectHieght(khieght * 0.02),
                Consumer<VarientAddingController>(
                  builder: (context, varientcontro, child) {
                    productModel.varients = varientcontro.varients;
                    return VerientContainer(
                        varientAddingController: varientcontro);
                  },
                ),
                CustomButton(
                  txt: 'Add to product',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      productModel.name = namecontroller.text.trim();
                      productModel.discription =
                          descrptionController.text.trim();
                      productModel.stringprice = priceController.text.trim();
                      productModel.stringdiscount =
                          discountController.text.trim();
                      await ProductServices().addProductToFirebase(
                        productModel: productModel,
                        context: context,
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
