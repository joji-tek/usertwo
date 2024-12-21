import 'package:flutter/material.dart';
import 'package:user2/screens/manage_rewards_screen.dart';
import 'package:user2/screens/promotion_screen.dart';

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
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ManageRewardsScreen()));
                    },
                    child: Text('Manage Rewards')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PromotionsScreen()));
                    },
                    child: Text('Promotions')),
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
      color: Color(0xFF28435A),
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
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF28435A)),
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
      appBar: AppBar(
        title: Text('${customer.name}'),
        backgroundColor: Color(0xFF28435A), // Dark Blue
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Profile Section
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      customer.profilePicture,
                      fit: BoxFit.contain,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  customer.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF28435A), // Dark Blue
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Loyalty Status: ${customer.loyaltyStatus}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFE5D58), // Coral
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(thickness: 1, color: Colors.grey.shade300),
              SizedBox(height: 16),

              // Points Balance Section
              _buildPointsBalance(),
              SizedBox(height: 24),

              // Loyalty History Section
              Text(
                'Loyalty History',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF28435A), // Dark Blue
                ),
              ),
              SizedBox(height: 12),
              _buildLoyaltyHistoryList(),
            ],
          ),
        ),
      ),
    );
  }

  // Points Balance Section Widget
  Widget _buildPointsBalance() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEAE7DA), // Light Cream
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Points Balance:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF28435A), // Dark Blue
            ),
          ),
          Text(
            '${customer.points}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFE5D58), // Coral
            ),
          ),
        ],
      ),
    );
  }

  // Loyalty History List Widget
  Widget _buildLoyaltyHistoryList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3, // Example history count
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Icon(Icons.star, color: Color(0xFFFE5D58)), // Coral
            title: Text(
              'Earned 500 points for brake service',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Date: 2024-12-21'),
            trailing: Text(
              'Points: +500',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF28435A), // Dark Blue
              ),
            ),
          ),
        );
      },
    );
  }
}
