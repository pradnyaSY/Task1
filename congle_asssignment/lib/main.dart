
import 'package:congle_asssignment/moving_square.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovingSquare();
  }
}