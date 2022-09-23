import 'package:protoDemo/src/generated/album.pbgrpc.dart';
import 'package:protoDemo/src/generated/album.pbjson.dart';
import 'package:grpc/grpc.dart';

class Service {
  static var channel = ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  Future<AlbumResponse> getAlbums() async {
    final stub =  AlbumServiceClient(channel);
    var response = await stub.getAlbums(AlbumRequest());
    return response;
  }
  //stub.getAlbumsWithPhotos
  Future<AlbumResponse> getAlbumsWithPhotos() async {
    final stub =  AlbumServiceClient(channel);
    var response = await stub.getAlbumsWithPhotos(AlbumRequest());
    return response;
  }
}
