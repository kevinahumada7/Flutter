import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
    
          return FadeInImage(
            placeholder: const AssetImage('assets/img/kitsune.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'));
        },
      ),
    );
  }

  Future<void> _obtenerPagina() async {
    Timer( const Duration(seconds: 2), () {
      _listaNumeros.clear();
      _agregar10();
      setState(() {});
    });

    return Future.delayed(const Duration(seconds: 2));
  }

  void _agregar10() {
    for( var i = 0; i<10; i++) {
      _listaNumeros.add(Random().nextInt(100));
    }
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    
    Timer( const Duration( seconds: 2), respuestaHTTP );
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250)
    );

    _agregar10();

    setState(() {});
  }

  Widget _crearLoading() {
    if(_isLoading) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator()
              ],
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}