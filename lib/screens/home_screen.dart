import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.fitness_center),
                title: const Text('Тренировка: Грудь и трицепс'),
                subtitle: const Text('18:00 • 60 минут'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Начать'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.restaurant),
                title: const Text('Калории сегодня: 1850 ккал'),
                subtitle: const Text('Белки: 120 г • Углеводы: 200 г'),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить тренировку'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.food_bank),
                  label: const Text('Добавить приём пищи'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
