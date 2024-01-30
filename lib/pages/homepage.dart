import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference<Map<String, dynamic>> _usersCollection =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _top(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions History',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _buildTransactionHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _top() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 30,
                        width: 40,
                        color: Colors.deepOrange,
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mr.x',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Total Balance:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        FutureBuilder<double>(
                          future: _getCurrentBalance(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                '\৳ ${snapshot.data}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return Text(
                                'Loading...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.deepOrange[400],
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 180),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.deepOrange[400],
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 35),
                            FutureBuilder<double>(
                              future: _getTotalIncome(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '\৳ ${snapshot.data}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 220),
                            FutureBuilder<double>(
                              future: _getTotalExpenses(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '\৳ ${snapshot.data}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<double> _getCurrentBalance() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _usersCollection.doc(widget.userEmail).get() as DocumentSnapshot<Map<String, dynamic>>;

      return userDoc['currentBalance'] ?? 0.0;
    } catch (e) {
      print('Error fetching current balance: $e');
      return 0.0;
    }
  }

  Future<double> _getTotalIncome() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _usersCollection.doc(widget.userEmail).get() as DocumentSnapshot<Map<String, dynamic>>;

      return userDoc['income'] ?? 0.0;
    } catch (e) {
      print('Error fetching total income: $e');
      return 0.0;
    }
  }

  Future<double> _getTotalExpenses() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _usersCollection.doc(widget.userEmail).get() as DocumentSnapshot<Map<String, dynamic>>;

      return userDoc['expenses'] ?? 0.0;
    } catch (e) {
      print('Error fetching total expenses: $e');
      return 0.0;
    }
  }

  Widget _buildTransactionHistory() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userEmail)
          .collection('transactions')
          .orderBy('datetime', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var transaction = snapshot.data!.docs[index].data()!;
              bool isExpense = transaction['type'] == 'expenses';

              return ListTile(
                title: Text(transaction['name']),
                subtitle: Text(transaction['explain']),
                trailing: Text(
                  isExpense ? '-৳ ${transaction['amount']}' : '+৳ ${transaction['amount']}',
                  style: TextStyle(
                    color: isExpense ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
