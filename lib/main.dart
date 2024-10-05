import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Builder Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GridviewCustomPage(),
    );
  }
}

class GridviewCustomPage extends StatefulWidget {
  const GridviewCustomPage({super.key});

  @override
  State<GridviewCustomPage> createState() => _GridviewCustomPageState();
}

class _GridviewCustomPageState extends State<GridviewCustomPage> {
  List<String> listProduct = List<String>.generate(50, (index) => 'Product $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gridview Custom',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.custom(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              // Use conditional to customize the first item
              if (index == 0) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      listProduct[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      listProduct[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
            childCount: listProduct.length,
          ),
        ),
      ),
    );
  }
}
