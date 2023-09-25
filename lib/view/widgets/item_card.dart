import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.imagepath,
    required this.discount,
    required this.productId,
    required this.price,
  });
  final String productId;
  final String name;
  final String imagepath;
  final String discount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kwidth * 0.02),
          color: const Color.fromARGB(255, 227, 225, 225),
          border: Border.all(color: const Color.fromARGB(255, 200, 200, 200)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  width: kwidth * 0.5,
                  height: khieght * 0.2,
                  fit: BoxFit.fitHeight,
                  imagepath,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    width: kwidth * 0.5,
                    height: khieght * 0.2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: GoogleFonts.inter(fontSize: 16)),
                        Row(
                          children: [
                            Text(
                              '$discount% OFF',
                              style: GoogleFonts.inter(color: Colors.green),
                            ),
                            const SizedBox(width: 30),
                            Text('\$$price'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text('Delete'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
