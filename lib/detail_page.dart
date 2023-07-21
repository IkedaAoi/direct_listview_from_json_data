import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.jsonUrls});
  // final int num;
  final Map<String, dynamic> jsonUrls;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Profile ▶︎ ${jsonUrls['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                jsonUrls['name'],
                style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: const Text('username'),
              subtitle: Text(jsonUrls['username'], style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.account_circle),
            ),
            ListTile(
              title: const Text('email'),
              subtitle: Text(jsonUrls['email'], style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.email),
            ),
            ListTile(
              title: const Text('Address'),
              subtitle: Text('${jsonUrls['address']['street']} ${jsonUrls['address']['suite']}'
                  '${jsonUrls['address']['city']}\n${jsonUrls['address']['zipcode']}'
                  , style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.home),
            ),
            ListTile(
              title: const Text('phone'),
              subtitle: Text(jsonUrls['phone'], style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.phone),
            ),
            ListTile(
              title: const Text('website'),
              subtitle: Text(jsonUrls['website'], style: const TextStyle(fontSize: 20)),
              leading: const Icon(Icons.web),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('company'),
                    subtitle: Text(jsonUrls['company']['name'], style: const TextStyle(fontSize: 20)),
                    leading: const Icon(Icons.business),
                  ),
                  const Text('catchPhrase', style: TextStyle(fontSize: 15)),
                  Text(jsonUrls['company']['catchPhrase'], style: const TextStyle(fontSize: 20)),
                  Text('bs: ${jsonUrls['company']['bs']}', style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
