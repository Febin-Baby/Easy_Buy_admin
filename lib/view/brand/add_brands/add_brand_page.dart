import 'package:easybuy_admin_app/controller/brand_image_provider/brand_image.dart';
import 'package:easybuy_admin_app/model/brand_model.dart';
import 'package:easybuy_admin_app/services/brand_services/brand_collection.dart';
import 'package:easybuy_admin_app/view/brand/add_brands/widgets/add_brand_textform.dart';
import 'package:easybuy_admin_app/view/brand/add_brands/widgets/image_container.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBrandPage extends StatelessWidget {
  AddBrandPage({super.key});

  static const String routname = '/Add brand';
  final TextEditingController brandname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        brandname.dispose();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const WidgetAppbar(title: 'Add Brand'),
          body: Padding(
            padding: EdgeInsets.all(kwidth * 0.05),
            child: SizedBox(
              height: khieght * 0.5,
              child: ChangeNotifierProvider(
                create: (context) => BrandImageProvider(),
                child: Consumer<BrandImageProvider>(
                  builder: (context, brandimagecontroller, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          brandimagecontroller.addImage();
                        },
                        child: ImageContainer(
                          imagePath: brandimagecontroller.imagePath,
                          height: khieght * 0.2,
                          width: kwidth * 0.95,
                        ),
                      ),
                      AddBrandTextField(controller: brandname),
                      ElevatedButton(
                        onPressed: () async {
                          debugPrint('Button');
                          final RegExp nameRegExp = RegExp('[a-zA-Z]');
                          if (brandimagecontroller.imagePath != null &&
                              brandname.text.trim() != '' &&
                              nameRegExp.hasMatch(brandname.text.trim(),)) {
                            BrandModel branddata = BrandModel(
                              imagepath: brandimagecontroller.imagePath!,
                              name: brandname.text.trim(),
                            );
                            await BrandServices().addBrandToFirebase(
                              brandModel: branddata,
                              context: context,
                            );
                          } else {
                            validationAlert(context);
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                              Size(kwidth * 0.43, khieght * 0.05)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          foregroundColor:
                              const MaterialStatePropertyAll(white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kwidth * 0.0225),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.add),
                            Text('Add Brand'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  validationAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('Brand name and Image is required'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
