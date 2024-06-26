import 'package:flutter/material.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({super.key, required this.topics});

  final List<Widget> topics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (BuildContext context, int index) {
        return topics[index];
      },
    );
  }
}
