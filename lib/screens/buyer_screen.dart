import 'package:flutter/material.dart';

class BuyerScreen extends StatelessWidget {
  const BuyerScreen({super.key});

  Widget productCard({
    required String crop,
    required String quantity,
    required String seller,
    required String location,
    required String price,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.agriculture,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        crop,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Farmer: $seller",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.inventory_2,
                  size: 18,
                  color: Colors.green,
                ),
                const SizedBox(width: 5),
                Text("Available: $quantity"),
              ],
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                Text(location),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text("Contact Farmer"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.green.shade100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Buyer Marketplace"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: const Row(
                children: [

                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Buyer Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Connect directly with farmers",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "Search crops...",
                prefixIcon:
                    const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryChip("Rice"),
                  const SizedBox(width: 8),
                  categoryChip("Vegetables"),
                  const SizedBox(width: 8),
                  categoryChip("Fruits"),
                  const SizedBox(width: 8),
                  categoryChip("Spices"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                children: [

                  productCard(
                    crop: "Rice",
                    quantity: "50 Quintal",
                    seller: "Ravi Kumar",
                    location: "Palakkad",
                    price: "₹4200",
                  ),

                  productCard(
                    crop: "Banana",
                    quantity: "200 Dozen",
                    seller: "Anil",
                    location: "Thrissur",
                    price: "₹55",
                  ),

                  productCard(
                    crop: "Tomato",
                    quantity: "500 Kg",
                    seller: "Suresh",
                    location: "Kochi",
                    price: "₹35",
                  ),

                  productCard(
                    crop: "Potato",
                    quantity: "1000 Kg",
                    seller: "Manoj",
                    location: "Wayanad",
                    price: "₹28",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}