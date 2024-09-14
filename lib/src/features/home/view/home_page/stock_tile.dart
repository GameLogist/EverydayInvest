import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockListTile extends StatelessWidget {
  final String name;
  final String ticker;
  final String price;
  final String percentChange;

  const StockListTile(
      {super.key,
      required this.name,
      required this.ticker,
      required this.price,
      required this.percentChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // decoration: BoxDecoration(color: Colors.blueGrey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name.toString(),
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              Text(
                ticker.toString(),
                style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹${price.toString()}",
                  style: GoogleFonts.nunito(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Text(
                  percentChange.isEmpty ? "" : "${percentChange}%",
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
