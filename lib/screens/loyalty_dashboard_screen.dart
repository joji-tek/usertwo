import 'package:flutter/material.dart';

// Dummy customer data class
class Customer {
  final String name;
  final String profilePicture;
  final int points;
  final String loyaltyStatus;

  Customer({
    required this.name,
    required this.profilePicture,
    required this.points,
    required this.loyaltyStatus,
  });
}

class LoyaltyDashboardScreen extends StatelessWidget {
  // Dummy customer list
  final List<Customer> customers = [
    Customer(
        name: 'John Doe',
        profilePicture: 'assets/img/image.png',
        points: 1500,
        loyaltyStatus: 'Gold'),
    Customer(
        name: 'Jane Smith',
        profilePicture: 'assets/img/car.png',
        points: 2300,
        loyaltyStatus: 'Silver'),
    Customer(
        name: 'Michael Lee',
        profilePicture: 'assets/img/LogoType.png',
        points: 1200,
        loyaltyStatus: 'Bronze'),
    Customer(
        name: 'Sara Davis',
        profilePicture: 'assets/img/car.png',
        points: 1750,
        loyaltyStatus: 'Gold'),
    Customer(
        name: 'David Brown',
        profilePicture: 'assets/img/car.png',
        points: 1900,
        loyaltyStatus: 'Silver'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loyalty Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotions and Stats Overview
            _buildPromotionBanner(),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Manage Rewards')),
                ElevatedButton(onPressed: () {}, child: Text('Promotions')),
              ],
            ),
            SizedBox(height: 16),
            _buildLoyaltyStats(),

            // Customer List
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return _buildCustomerCard(customer, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Promotion Banner Section
  Widget _buildPromotionBanner() {
    return Card(
      color: Colors.blueAccent,
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(
          'Double Points on Brake Services!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Offer valid for this week only. Hurry!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Loyalty Stats Overview
  Widget _buildLoyaltyStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Active Customers', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('120',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Points Earned', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('45,000',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  // Customer Card Widget
  Widget _buildCustomerCard(Customer customer, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: ClipOval(
              child: Image.asset(
            customer.profilePicture,
            fit: BoxFit.cover,
          )),
          radius: 30,
        ),
        title: Text(customer.name),
        subtitle: Text(
            'Points: ${customer.points} | Status: ${customer.loyaltyStatus}'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {
          // Navigate to customer details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerDetailsScreen(customer: customer),
            ),
          );
        },
      ),
    );
  }
}

class CustomerDetailsScreen extends StatelessWidget {
  final Customer customer;

  CustomerDetailsScreen({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${customer.name} - Loyalty Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Profile
            CircleAvatar(
              child: ClipOval(
                child: Image.asset(customer.profilePicture),
              ),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(
              customer.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Points Balance: ${customer.points}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),

            // Loyalty History
            Text('Loyalty History:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3, // Example history count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Earned 500 points for brake service'),
                  subtitle: Text('Date: 2024-12-21'),
                  trailing: Text('Points: +500'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
