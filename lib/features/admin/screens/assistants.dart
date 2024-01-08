import 'package:flutter/material.dart';
import 'package:turbo_robot/features/admin/screens/assistant.dart';

class AssistantsScreen extends StatelessWidget {
  const AssistantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.analytics_outlined),
                label: Row(
                  children: [
                    const Text('dashboard'),
                    IconButton(
                      onPressed: () {
                        print('a');
                      },
                      icon: const Icon(Icons.legend_toggle),
                    ),
                  ],
                ),
              ),
              const NavigationRailDestination(
                icon: Icon(Icons.android_outlined),
                label: Text('assistants'),
              ),
            ],
            selectedIndex: 0,
            extended: true,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                children: [
                  Row(
                    children: [
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AssistantScreen(),
                            ),
                          );
                        },
                        child: const Text('create'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Table(
                    border: const TableBorder(
                      // bottom: BorderSide(),
                      horizontalInside: BorderSide(),
                    ),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(
                            child: Text('id'),
                          ),
                          TableCell(
                            child: Text(
                              'name',
                            ),
                          ),
                          TableCell(
                            child: Text("description"),
                          ),
                          TableCell(
                            child: Text("model"),
                          ),
                          TableCell(
                            child: Text("instructions"),
                          ),
                        ],
                      ),
                      ...[1, 2, 3].map((int num) => TableRow(
                            children: [
                              TableCell(
                                child: Text(num.toString()),
                              ),
                              const TableCell(
                                child: Text(
                                  'assistant',
                                ),
                              ),
                              const TableCell(
                                child: Text("description"),
                              ),
                              const TableCell(
                                child: Text("model"),
                              ),
                              const TableCell(
                                child: Text("instructions"),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
