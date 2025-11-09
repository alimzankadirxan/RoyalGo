import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details_screen.dart'; // Второй экран

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _trainingCount = 0;
  int _calories = 1850;

  @override
  void initState() {
    super.initState();
    _loadData(); // Загрузка сохранённых данных при запуске
  }

  // Загрузка данных из SharedPreferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _trainingCount = prefs.getInt('trainingCount') ?? 0;
      _calories = prefs.getInt('calories') ?? 1850;
    });
  }

  // Увеличение количества тренировок
  void _incrementTraining() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _trainingCount++;
      _calories += 100; // пример: тренировка сжигает 100 ккал
    });
    await prefs.setInt('trainingCount', _trainingCount);
    await prefs.setInt('calories', _calories);
  }

  // Добавление приёма пищи
  void _addMeal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _calories += 250; // пример: добавление пищи
    });
    await prefs.setInt('calories', _calories);
  }

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

            // Карточка с тренировкой
            Card(
              child: ListTile(
                leading: const Icon(Icons.fitness_center),
                title: Text('Тренировка: Грудь и трицепс ($_trainingCount)'),
                subtitle: const Text('18:00 • 60 минут'),
                trailing: ElevatedButton(
                  onPressed: _incrementTraining,
                  child: const Text('Начать'),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Карточка с калориями
            Card(
              child: ListTile(
                leading: const Icon(Icons.restaurant),
                title: Text('Калории сегодня: $_calories ккал'),
                subtitle: const Text('Белки: 120 г • Углеводы: 200 г'),
              ),
            ),
            const SizedBox(height: 12),

            // Кнопка перехода на экран деталей
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsScreen(),
                    ),
                  );
                },
                child: const Text('Перейти на экран деталей'),
              ),
            ),

            const Spacer(),

            // Кнопки добавления тренировок и приёма пищи
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _incrementTraining,
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить тренировку'),
                ),
                ElevatedButton.icon(
                  onPressed: _addMeal,
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
