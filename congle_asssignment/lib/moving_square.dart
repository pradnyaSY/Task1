// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class MovingSquare extends StatelessWidget {
  const MovingSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Moving Square',
      debugShowCheckedModeBanner: false,
      home: MovingSquareScreen(),
    );
  }
}

class MovingSquareScreen extends StatefulWidget {
  const MovingSquareScreen({super.key});

  @override
  _MovingSquareScreenState createState() => _MovingSquareScreenState();
}

class _MovingSquareScreenState extends State<MovingSquareScreen> {
  Alignment _alignment = Alignment.center;
  bool _isAnimating = false;

  void _moveLeft() {
    setState(() {
      _isAnimating = true;
      _alignment = Alignment.centerLeft;
    });
  }

  void _moveRight() {
    setState(() {
      _isAnimating = true;
      _alignment = Alignment.centerRight;
    });
  }

  void _onAnimationEnd() {
    setState(() {
      _isAnimating = false;
    });
  }

  bool get isAtLeft => _alignment == Alignment.centerLeft;
  bool get isAtRight => _alignment == Alignment.centerRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade200, Colors.purple.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Slide the Square',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: const [Shadow(blurRadius: 4, color: Colors.black26)],
                ),
              ),
              Expanded(
                child: AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  onEnd: _onAnimationEnd,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 8),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed:
                          (!_isAnimating && !isAtLeft) ? _moveLeft : null,
                      icon: Icon(Icons.arrow_back),
                      label: Text("To Left"),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        disabledForegroundColor: Colors.white.withOpacity(0.5),
                        disabledBackgroundColor: Colors.white.withOpacity(0.3),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed:
                          (!_isAnimating && !isAtRight) ? _moveRight : null,
                      icon: Text("To Right"),
                      label: Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        disabledForegroundColor: Colors.white.withOpacity(0.5),
                        disabledBackgroundColor: Colors.white.withOpacity(0.3),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
