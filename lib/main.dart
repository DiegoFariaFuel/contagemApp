// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageInicial(),
    );
  }
}

class HomePageInicial extends StatefulWidget {
  const HomePageInicial({super.key});

  @override
  State<HomePageInicial> createState() => _HomePageInicialState();
}

class _HomePageInicialState extends State<HomePageInicial> {
  int contador = 0;
  late Color cor;

  void decrement() {
    setState(() {
      contador--;
      print(contador);
    });
  }

  void increment() {
    setState(() {
      contador++;
      print(contador);
    });
  }

   bool get isEmpty => contador == 0;
   bool get isFull => contador == 20;

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.amber,
      appBar: AppBar( title: const Text('Conta+',style: TextStyle(color: Colors.amber) ,),),drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       
        children: [
          
           Text(
            isFull ? 'Lotado!' : 'Pode entrar!',
            style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.black45,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height : 40),
          const Text(
            'Quantidade maxima = 20 !',
            style: TextStyle(
                fontSize: 20, color:  Colors.blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30,),
          Text(
            '$contador',
            style: TextStyle(fontSize: 100,color: isFull ? Colors.red:Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 20,
          ),
          

          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(100, 100)),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    'SAIU',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(width: 20 ,height: 40),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: isFull ? Colors.white.withOpacity(0.5):Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(100,100) /*const EdgeInsets.fromLTRB(10, 20, 10, 20)*/),
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    'ENTROU',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ))
            ],
          )
        ],
      ),
    );
  }

  //appBar: AppBar( title: const Text('Bem vindo'),),drawer: const Drawer(),

}


