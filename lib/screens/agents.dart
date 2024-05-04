import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item{
  final String name;
  final int priceKES;
  final int priceUSD;
  final String imageUrl;
  final String status;

  Item({
    required this.name,
    required this.priceKES,
    required this.priceUSD,
    required this.imageUrl,
    required this.status,
  });
}

 class Agent {
  final String name;
  final String contact;
  final String company;
  final List<Item> items;

  Agent({
    required this.name,
    required this.contact,
    required this.company,
    required this.items,
  });
 }  

class AgentsPage extends StatelessWidget {
  final List <Agent> agents =[
      Agent(
        name: 'Agent Serah',
        contact: '0746893446',
        company: 'ABC Realty',
        items: [
          Item(
         name: 'Luxury House',
      priceKES: 100000,
      priceUSD: 1000,
      imageUrl: 'https://www.africa.com/wp-content/uploads/2021/04/Luxurious-Homes-1.jpg',
      status: 'available',
          ),
      Item(
      name: 'SUV car',
      priceKES: 80000,
      priceUSD: 500,
      imageUrl: 'https://www.thestreet.com/.image/t_share/MTkzNjMxNTIzMjM5MzcyMjI3/chevrolet-trax-lead-js-110922.jpg',
      status: 'rented',
          ),
        ],
      ),
       Agent(
        name: 'Agent Mark',
        contact:'0721106218',
        company: 'XYZ Realty',
        items:[
          Item(
             name: '3 BedRoom house',
      priceKES: 50000,
      priceUSD: 500,
      imageUrl: 'https://i.roamcdn.net/prop/brk/listing-thumb-376w/2f0ebf711ce5184f32d15c2153dc3d34/-/prod-property-core-backend-media-brk/6429004/0a8c86cc-dfc7-4ae7-9f3e-06e6498af1f5.jpg',
      status: 'available',
          ),
          Item(
             name: 'Juke car',
      priceKES: 50000,
      priceUSD: 500,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ27yVPu8Cq52Nv0YNrLSwZp17GgtxFZ86DlAdNJr7T37BrdQcKjMJvUhW4zUwAjhpXsws&usqp=CAU',
      status: 'available',
          ),
        ],
       ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agents'),
      ),
      body:ListView.builder(
        itemCount: agents.length,
        itemBuilder:(context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  agents[index].name,
                  style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                itemCount: agents[index].items.length,
                itemBuilder: (context, idx) {
                  Item item = agents[index].items[idx];
                  return ListTile(
                    leading:Image.network(
                      item.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     Text(
                      'KES ${item.priceKES}| USD${item.priceUSD}\nStatus:${item.status}',
                      style: TextStyle(color:item.status=='available'?Colors.green:Colors.red),
                    ),
                    
                    Text(
                      'Contact: ${agents[index].contact}',
                      style: TextStyle(
                        color: item.status == 'available' ? Colors.green : Colors.red,
                      ),
                    ),
                   ],
                 ),
                    trailing: Text(agents[index].company),
                    onTap:() {

                    },
                  );
                },
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title:'RentandBuy',
    theme: ThemeData(
      primarySwatch:Colors.blue,
    ),
    home: AgentsPage(),
  ));
}