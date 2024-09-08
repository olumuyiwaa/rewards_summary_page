import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashOutTile extends StatelessWidget {
  final double cashOutAmount;
  final String? transactionDate;

  CashOutTile({
    super.key,
    required this.cashOutAmount,
    this.transactionDate,
  });
  final formatter = NumberFormat('#,##0.00');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₦ ${formatter.format(cashOutAmount)}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Date: ${transactionDate ?? 'N/A'}', // Show 'N/A' if transactionDate is null
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
