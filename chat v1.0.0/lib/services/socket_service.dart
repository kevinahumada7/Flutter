import 'package:chat/global/environment.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:web_socket_channel/io.dart';

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late final _socket;

  ServerStatus get serverStatus => this._serverStatus;
  
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  void connect() async {

    try {
      final token = await AuthService.getToken();

      /* final channel = IOWebSocketChannel.connect(Environment.socketUrl, headers:
      {
        'transports': ['websocket'],
        'autoConnect': true,
        'forceNew': true,
        //Envia headers personalizados
        'extraHeaders': {
          'x-token': token
        }
      }); */
    
       /* this._socket = IO.io(Environment.socketUrl, 
        IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .enableForceNew()
          .setExtraHeaders({'x-token': token})
          .build()
      ); */

      // Dart client
      this._socket = IO.io( Environment.socketUrl , {
        'transports': ['websocket'],
        'autoConnect': true,
        'forceNew': true,
        //Envia headers personalizados
        'extraHeaders': {
          'x-token': token
        },
        'query': {
          'x-token': token
        },
        'auth':{
          'token':'putoelquelee'
        }
      });
      

      this._socket.on('connect', (_) {
        this._serverStatus = ServerStatus.Online;
        print(_serverStatus);
        notifyListeners();
      });

      this._socket.on('disconnect', (_) {
        this._serverStatus = ServerStatus.Offline;
        print(_serverStatus);
        notifyListeners();
      });

    } catch (e) {
      print(e);
    }

  }

  void disconnect() {
    this._socket.disconnect();
  }

}