import 'package:flutter/material.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions for Car Repair Shops'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Add refresh logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction Text
            Text(
              'Use your earned points for extra exposure and advertisement!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Current Points
            _buildCurrentPointsSection(),
            SizedBox(height: 20),

            // Available Promotions
            Text(
              'Available Promotions:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildAvailablePromotions(context),
            SizedBox(height: 20),

            // Redeem Points
            _buildRedeemPointsSection(context),
          ],
        ),
      ),
    );
  }

  // Display current points
  Widget _buildCurrentPointsSection() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('Your Current Points'),
        subtitle: Text('2,500 points'),
        trailing: Icon(Icons.star, color: Colors.amber),
      ),
    );
  }

  // Display available promotions
  Widget _buildAvailablePromotions(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3, // Example promotions count
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('Promotional Package #$index'),
            subtitle: Text('Exposure Boost for 1 Week'),
            trailing: Text('500 points'),
            onTap: () {
              // Handle promotion selection logic
              _showRedeemDialog(context);
            },
          ),
        );
      },
    );
  }

  // Section to redeem points
  Widget _buildRedeemPointsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Redeem your points for promotions:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Handle redemption logic here
            _showRedeemDialog(context);
          },
          child: Text('Redeem Points'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Changed to backgroundColor
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // Dialog to confirm point redemption
  void _showRedeemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Redeem Points'),
          content: Text(
              'Are you sure you want to redeem 500 points for the promotion?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle promotion redemption logic
                Navigator.pop(context);
                _showSuccessDialog(context);
              },
              child: Text('Redeem'),
            ),
          ],
        );
      },
    );
  }

  // Success dialog after redemption
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('You have successfully redeemed your points!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
