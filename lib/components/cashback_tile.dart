import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashbackTile extends StatelessWidget {
  final double cashBackAmount;
  final String? transactionDate;
  final String? transactionTitle;
  final String? transactionID;

  CashbackTile({
    super.key,
    required this.cashBackAmount,
    this.transactionDate,
    this.transactionTitle,
    this.transactionID,
  });
  final formatter = NumberFormat('#,##0.00');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$transactionTitle (ID: $transactionID)',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Date: $transactionDate',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('₦ ${formatter.format(cashBackAmount)}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    'Cashback ₦ ${formatter.format(cashBackAmount * (1.5 / 100))}',
                    style: const TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
