import 'package:flutter/material.dart';
import 'package:test_1/model/cat.dart';
import 'package:test_1/services/web_services.dart';

class CatListPage extends StatelessWidget {
  const CatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat list'),
      ),
      body: FutureBuilder<List<Cat>>(
        future: WebService().fetchCats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator.adaptive());
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final cat = snapshot.data![index];
              return Card(
                child: Column(
                  children: [
                    Text(cat.id.toString()),
                    Text(cat.name),
                    Text(cat.age.toString()),
                    Image.network(cat.imageUrl), 
                    Text(cat.type),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
