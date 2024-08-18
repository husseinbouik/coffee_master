import 'package:flutter/material.dart';

class Offerspage extends StatelessWidget {
  const Offerspage({super.key});

  @override
  Widget build(BuildContext context) {
    return offer(title: "My great offer ever", description: "Buy 1, Get 10 for free");
  }
}
class offer extends StatelessWidget {

  final String title;
  final String description;

  const offer({Key? key,required this.title,required this.description,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(title,style: Theme.of(context).textTheme.headlineMedium)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(description,style: Theme.of(context).textTheme.headlineSmall)),
      ),
    ],);
  }
}