import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false, // Устанавливаем значение false
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '';
  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operator = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '';
        _firstNumber = 0;
        _secondNumber = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _firstNumber = double.parse(_displayText);
        _operator = buttonText;
        _displayText = '';
      } else if (buttonText == '=') {
        _secondNumber = double.parse(_displayText);
        switch (_operator) {
          case '+':
            _displayText = (_firstNumber + _secondNumber).toString();
            break;
          case '-':
            _displayText = (_firstNumber - _secondNumber).toString();
            break;
          case '*':
            _displayText = (_firstNumber * _secondNumber).toString();
            break;
          case '/':
            _displayText = (_firstNumber / _secondNumber).toString();
            break;
        }
      } else {
        _displayText += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey[700],
              shape: RoundedRectangleBorder(),
            ),
            onPressed: () => _onButtonPressed(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                _displayText,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('7'),
                      _buildButton('8'),
                      _buildButton('9'),
                      _buildButton('/'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('4'),
                      _buildButton('5'),
                      _buildButton('6'),
                      _buildButton('*'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('1'),
                      _buildButton('2'),
                      _buildButton('3'),
                      _buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('C'),
                      _buildButton('0'),
                      _buildButton('='),
                      _buildButton('+'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}