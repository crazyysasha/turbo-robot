import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('name'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('instructions'),
            ),
            minLines: 3,
            maxLines: 30,
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('save'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('save as draft'),
              ),
              Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
