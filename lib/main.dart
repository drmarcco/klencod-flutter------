dart
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: AppBar(
title: const Text('لعبة الحضارة العراقية'),
),
body: const GameScreen(),
),
);
}
}
class GameScreen extends StatefulWidget {
const GameScreen({Key? key}) : super(key: key);
@override
_GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
final TextEditingController _controller = TextEditingController();
final String _correctAnswer = 'الملك';
String _feedback = '';
void _checkAnswer() {
setState(() {
if (_controller.text.trim() == _correctAnswer) {
_feedback = 'إجابة صحيحة!';
} else {
_feedback = 'إجابة خاطئة، حاول مجدداً.';
}
});
}
@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'LUGAL',
style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
),
const SizedBox(height: 20),
const Text(
'ما هي ترجمة هذا الرمز؟',
style: TextStyle(fontSize: 18),
),
const SizedBox(height: 20),
TextField(
controller: _controller,
decoration: const InputDecoration(
border: OutlineInputBorder(),
labelText: 'الترجمة',
),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: _checkAnswer,
child: const Text('تحقق'),
),
const SizedBox(height: 20),
Text(
_feedback,
style: TextStyle(
fontSize: 18,
color: _feedback == 'إجابة صحيحة!' ? Colors.green : Colors.red,
),
),
],
),
);
}
}