import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDeliveryAndDetails extends StatelessWidget {
  const ProductDeliveryAndDetails(
      {super.key, required this.isAnalog, required this.isWaterResistant});
  final bool isAnalog;
  final bool isWaterResistant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'FREE DELIVERY',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20, child: VerticalDivider(color: Colors.grey)),
            Text('Delivery in 5 days', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
          ],
        ),
        _titletext('Product Details'),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailtext('Water Resistant', false),
                _detailtext('Display Type', false),
              ],
            ),
            SizedBox(width: kwidth * 0.15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailtext(isWaterResistant ? 'Yes' : 'No', true),
                _detailtext(isAnalog ? 'Analog' : 'Digital', true),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      selectHieght(khieght * 0.01),
      Text(text),
    ]);
  }

  Widget _detailtext(String text, bool isblack) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectHieght(khieght * 0.01),
        Text(text, style: GoogleFonts.inter(fontSize: 12, color: isblack ? black : Colors.grey))
      ],
    );
  }
}
