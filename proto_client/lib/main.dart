import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:protoDemo/grpc_demo.dart' as sdk;
import 'package:proto_client/service/client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter flash',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Flash'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return FutureBuilder<sdk.AlbumResponse>(
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.albums.length,
              itemBuilder: (context, i) {
                final obj = snapshot.data!.albums[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(obj.photos.first.url),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(obj.title)),
                );
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: Service().getAlbumsWithPhotos(),
    );
  }
}
