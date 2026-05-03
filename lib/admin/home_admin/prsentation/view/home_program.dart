import 'package:flutter/material.dart';

class HomeProgram extends StatelessWidget {
  const HomeProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Program'),
      ),
      body: HomeProgramViewBody(),
    );
  }
}

class HomeProgramViewBody extends StatelessWidget {
  const HomeProgramViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Home Program'),
        Text('Home Program'),
        Text('Home Program'),
      ],
    );
  }
}