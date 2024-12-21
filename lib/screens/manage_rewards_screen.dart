import 'package:flutter/material.dart';

class ManageRewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Rewards"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total rewards section
              _buildSectionTitle("Total Active Rewards: 4"),
              SizedBox(height: 20),

              // Reward List
              _buildSectionTitle("Active Rewards"),
              _buildRewardList(),

              SizedBox(height: 20),

              // Buttons for adding new rewards and saving changes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      "Add New Reward",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section title for headings like "Active Rewards"
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // List of active rewards (just a simple list view for now)
  Widget _buildRewardList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReward("10% Discount on Service", "Valid Until 12/31/2024"),
          _buildReward("Free Oil Change", "Valid Until 12/25/2024"),
          _buildReward("Free Car Wash", "Valid Until 01/15/2025"),
          _buildReward("20% Off Parts Purchase", "Valid Until 12/31/2024"),
        ],
      ),
    );
  }

  // Row displaying individual reward details with edit and delete buttons
  Widget _buildReward(String rewardName, String validity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rewardName,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                validity,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
                tooltip: "Edit Reward",
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
                tooltip: "Delete Reward",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
