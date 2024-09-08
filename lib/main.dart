import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/cashback_tile.dart';
import '../components/cashout_tile.dart';

void main() {
  runApp(const RewardsPage());
}

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  // Mock data
  double currentBalance = 0;
  final formatter = NumberFormat('#,##0.00');

  final List cashbackHistory = [
    {
      'date': '2024-08-10',
      'amount': 30000.00,
      'bookingId': 'BK123456',
      'service': 'Flight Booking'
    },
    {
      'date': '2024-08-15',
      'amount': 145000.00,
      'bookingId': 'BK987654',
      'service': 'Hall Booking'
    },
    {
      'date': '2024-08-20',
      'amount': 57750.00,
      'bookingId': 'BK654321',
      'service': 'Hotel Booking'
    },
  ];

  double calculateTotalCashbackEarned() {
    double total = 0.0;
    for (var transaction in cashbackHistory) {
      total += transaction['amount'] * (1.5 / 100);
    }
    return total;
  }

  final List cashoutHistory = [
    {
      'date': '2024-08-15',
      'amount': 1450.00,
    },
  ];

  double calculateTotalCashout() {
    double total = 0.0;
    for (var cashout in cashoutHistory) {
      total += cashout['amount'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalCashbackEarned = calculateTotalCashbackEarned();
    double totalCashoutSpent = calculateTotalCashout();
    currentBalance = totalCashbackEarned - totalCashoutSpent;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          title: const Text('Balanceè Rewards'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Earnings Overview
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('image/background.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 4, bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rewards Overview',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Current Balance:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '₦ ${formatter.format(currentBalance)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Earned:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            '₦ ${formatter.format(totalCashbackEarned)}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Cashback History
              const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text('Cashback History',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ))),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cashbackHistory.length,
                itemBuilder: (context, index) {
                  return CashbackTile(
                      cashBackAmount: cashbackHistory[index]['amount'],
                      transactionDate: cashbackHistory[index]['date'],
                      transactionID: cashbackHistory[index]['bookingId'],
                      transactionTitle: cashbackHistory[index]['service']);
                },
              ),
              // Cashout History
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text('Cashout History',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cashoutHistory.length,
                    itemBuilder: (context, index) {
                      return CashOutTile(
                          cashOutAmount: (cashoutHistory[index]['amount']),
                          transactionDate: cashoutHistory[index]['date']);
                    },
                  ),
                ],
              ),
              // Cashout Options
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cashout Options',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Direct Cashout logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 1, 107, 195),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text('Direct Cashout'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Promo Code logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 62, 10),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              child: const Text('Promo Codes'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
