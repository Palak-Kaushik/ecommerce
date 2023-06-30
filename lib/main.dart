import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 105, 8, 224)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var cart = <String>[];
  var price=0;
  var item = "Apples";
   var item1="Bananas";
   var item2="Watermelons";
   var item3="Mangoes";
  
   void addtoCart() {
    if (cart.contains(item)) {
      cart.remove(item);
      price-=120;
    } else {
      cart.add(item);
      price+=120;
    }
    notifyListeners();
  } 
   void addtoCart1() {
    if (cart.contains(item1)) {
      cart.remove(item1);
      price-=30;
    } else {
      cart.add(item1);
      price+=30;
    }
    notifyListeners();
  } 
   void addtoCart2() {
    if (cart.contains(item2)) {
      cart.remove(item2);
      price-=50;
    } else {
      cart.add(item2);
      price+=50;
    }
    notifyListeners();
  } 
   void addtoCart3() {
    if (cart.contains(item3)) {
      cart.remove(item3);
      price-=75;
    } else {
      cart.add(item3);
      price+=75;
    }
    notifyListeners();
  } 
  }


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ListPage();
        break;
      case 1:
        page = CartPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,  // ← Here.
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Cart'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    

    IconData icon;
    if (appState.cart.contains('Apples')) {
      icon = Icons.shopping_cart;
    } else {
      icon = Icons.shopping_cart_checkout;
    }

    IconData icon1;
    if (appState.cart.contains('Bananas')) {
      icon1 = Icons.shopping_cart;
    } else {
      icon1 = Icons.shopping_cart_checkout;
    }

    IconData icon2;
    if (appState.cart.contains('Watermelons')) {
      icon2 = Icons.shopping_cart;
    } else {
      icon2 = Icons.shopping_cart_checkout;
    }

    IconData icon3;
    if (appState.cart.contains('Mangoes')) {
      icon3 = Icons.shopping_cart;
    } else {
      icon3 = Icons.shopping_cart_checkout;
    }
  
    return GridView.count(
      crossAxisCount: 3,  
      crossAxisSpacing: 4.0,  
      mainAxisSpacing: 4.0,  
      children: [
          BigCard(),
          SizedBox(height: 5),
          Row(
             children: [
              Padding(
          padding: const EdgeInsets.all(20),
          child: Text(' Price: 120 Rs.'),
        ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.addtoCart();
                },
                icon: Icon(icon),
                label: Text('Add to cart'),
              ),
              
              SizedBox(width: 10),
              
            ],
          ),
          BigCard1(),
          SizedBox(height: 10),
          Row(
            
            children: [
              Padding(
          padding: const EdgeInsets.all(20),
          child: Text(' Price: 30 Rs.'),
        ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.addtoCart1();
                },
                icon: Icon(icon1),
                label: Text('Add to cart'),
              ),
              
              SizedBox(width: 10),
              
            ],
          ),
          BigCard2(),
          SizedBox(height: 10),
          Row(
            
            children: [
              Padding(
          padding: const EdgeInsets.all(20),
          child: Text(' Price: 50 Rs.'),
        ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.addtoCart2();
                },
                icon: Icon(icon2),
                label: Text('Add to cart'),
              ),
              
              SizedBox(width: 10),
              
            ],
          ),
          BigCard3(),
          SizedBox(height: 10),
          Row(
            
            children: [
              Padding(
          padding: const EdgeInsets.all(20),
          child: Text(' Price: 75 Rs.'),
        ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.addtoCart3();
                },
                icon: Icon(icon3),
                label: Text('Add to cart'),
              ),
              
              SizedBox(width: 10),
              
            ],
          ),


        ],
      );
  }
}

class BigCard extends StatelessWidget {
  final String pair='Apples';

  @override
    Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, 
      child: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair, 
          style:style,
          semanticsLabel: pair,),
      ),
    );
  }
}


class BigCard1 extends StatelessWidget {
  

  final String pair='Bananas';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, 
      child: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair, 
          style:style,
          semanticsLabel: pair,),
      ),
    );
  }
}


class BigCard2 extends StatelessWidget {
   

   final String pair='Watermelons';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, 
      child: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair, 
          style:style,
          semanticsLabel: pair,),
      ),
    );
  }
}


class BigCard3 extends StatelessWidget {
   

   final String pair='Mangoes';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, 
      child: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair, 
          style:style,
          semanticsLabel: pair,),
      ),
    );
  }
}


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.cart.isEmpty) {
      return Center(
        child: Text('Nothing added to cart yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.cart.length} items added:'),
        ),
        for (var pair in appState.cart)
          ListTile(
            leading: Icon(Icons.add),
            title: Text(pair),
          ),
          Padding(
          padding: const EdgeInsets.all(40),
          child: Text('Total Price: '
              '${appState.price} Rs.'),
        ),
      ],
    );
  }
}