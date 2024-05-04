import 'package:flutter/material.dart';
import 'package:rent_and_buy/screens/agents.dart';
import 'package:rent_and_buy/screens/home_page.dart';

class ForRentPage extends StatelessWidget {
  List<RentalItem> get houseItems => [
    RentalItem(
      name: 'Luxury House',
      priceKES: 100000,
      priceUSD: 1000,
      imageUrl: 'https://www.africa.com/wp-content/uploads/2021/04/Luxurious-Homes-1.jpg',
      agentName: 'Agent Serah',
    ),
    RentalItem(
      name: '3 BedRoom house',
      priceKES: 50000,
      priceUSD: 500,
      imageUrl: 'https://i.roamcdn.net/prop/brk/listing-thumb-376w/2f0ebf711ce5184f32d15c2153dc3d34/-/prod-property-core-backend-media-brk/6429004/0a8c86cc-dfc7-4ae7-9f3e-06e6498af1f5.jpg',
      agentName: 'Agent Mark',
    ),
  ];

  List<RentalItem> get carItems => [
    RentalItem(
      name: 'SUV car',
      priceKES: 80000,
      priceUSD: 500,
      imageUrl: 'https://www.thestreet.com/.image/t_share/MTkzNjMxNTIzMjM5MzcyMjI3/chevrolet-trax-lead-js-110922.jpg',
      agentName: 'Agent Serah',
    ),
    RentalItem(
      name: 'Juke car',
      priceKES: 50000,
      priceUSD: 500,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ27yVPu8Cq52Nv0YNrLSwZp17GgtxFZ86DlAdNJr7T37BrdQcKjMJvUhW4zUwAjhpXsws&usqp=CAU',
      agentName: 'Agent Mark',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text('For Rent'),
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => HomePage(),
            ),
          );
        },
      ),
     ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySlideshow(title: 'Houses', context: context, items: houseItems),
            _buildCategorySlideshow(title: 'Cars', context: context, items: carItems),
          ],
        ),
      ),
    );
  }
}

  Widget _buildCategorySlideshow({required String title, required BuildContext context, required List<RentalItem> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildItemCard(context, item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(BuildContext context, RentalItem item) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item.imageUrl,
            width: 200,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>  AgentsPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 4),
                      Text(
                        'Agent: ${item.agentName}',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


class RentalItem {
  final String name;
  final int priceKES;
  final int priceUSD;
  final String imageUrl;
  final String agentName;

  RentalItem({
    required this.name,
    required this.priceKES,
    required this.priceUSD,
    required this.imageUrl,
    required this.agentName,
  });
}
