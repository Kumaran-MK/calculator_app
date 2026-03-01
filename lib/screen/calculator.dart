import 'package:calculator/widget/button_widget.dart';
import 'package:flutter/material.dart';

class CalCulator extends StatefulWidget {
  final VoidCallback toThemeChange;

  const CalCulator({super.key, required this.toThemeChange});

  @override
  State<CalCulator> createState() => _CalCulatorState();
}

class _CalCulatorState extends State<CalCulator> {
  String input = "";
  String result = "";

  void ButtonClick(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "";
      } else if (value == "Del") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        setState(() {
          calCulation();
          // input = result;
        });
      } else {
        input += value;
      }
      print(value);
    });
  }

  void calCulation() {
    try {
      String finalOutput = input.replaceAll("X", "*").replaceAll("÷", "/")
        ..replaceAll("%", "/100");

      List<String> numbers = finalOutput.split(RegExp(r'[+\-\*/%]'));

      double resultValue = double.parse(numbers[0]);
      // double secondNumber = double.parse(numbers[1]);

      List<String> operators = finalOutput
          .replaceAll(RegExp(r'[0-9.]'), "")
          .split("");

      for (int i = 0; i < operators.length; i++) {
        double nextNumber = double.parse(numbers[i + 1]);
        if (operators[i] == "+") {
          resultValue += nextNumber;
        } else if (operators[i] == "-") {
          resultValue -= nextNumber;
        } else if (operators[i] == "*") {
          resultValue *= nextNumber;
        } else if (operators[i] == "/") {
          resultValue /= nextNumber;
        } else if (operators[i] == "%") {
          resultValue %= nextNumber;
        }
      }
      setState(() {
        if (resultValue % 1 == 0) {
          result = resultValue.toInt().toString();
        } else {
          result = resultValue.toString();
        }
      });
    } catch (e) {
      print("Err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      input.isEmpty ? "0" : input,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 30),
          Divider(thickness: 1),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingButton(
                text: "C",
                onPressed: () => ButtonClick("C"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: 30,
              ),
              EditingButton(
                text: "Del",
                onPressed: () => ButtonClick("Del"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: 15,
              ),
              EditingButton(
                text: "/",
                onPressed: () => ButtonClick("/"),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "%",
                onPressed: () => ButtonClick("%"),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
            ],
          ),

          SizedBox(height: 12),

          /// 7 8 9 * ////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingButton(
                text: "7",
                onPressed: () => ButtonClick("7"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "8",
                onPressed: () => ButtonClick("8"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "9",
                onPressed: () => ButtonClick("9"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "*",
                onPressed: () => ButtonClick("*"),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
            ],
          ),
          SizedBox(height: 12),

          ///  4 5 6 - ////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingButton(
                text: "4",
                onPressed: () => ButtonClick("4"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "5",
                onPressed: () => ButtonClick("5"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "6",
                onPressed: () => ButtonClick("6"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "-",
                onPressed: () => ButtonClick("-"),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
            ],
          ),
          SizedBox(height: 12),

          ///---1 2 3 + //////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingButton(
                text: "1",
                onPressed: () => ButtonClick("1"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "2",
                onPressed: () => ButtonClick("2"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "3",
                onPressed: () => ButtonClick("3"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "+",
                onPressed: () => ButtonClick("+"),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
            ],
          ),
          SizedBox(height: 12),

          ///---- mod 0 . =  ////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditingButton(
                text: "Mod",
                onPressed: widget.toThemeChange,
                color: Colors.white,
                textColor: Colors.black,
                height: 70,
                wighth: 70,
                fontsize: 10,
              ),
              EditingButton(
                text: "0",
                onPressed: () => ButtonClick("0"),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: ".",
                onPressed: () => ButtonClick("."),
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
              EditingButton(
                text: "=",
                onPressed: () => ButtonClick("="),
                color: Colors.blue,
                textColor: Colors.white,
                height: 70,
                wighth: 70,
                fontsize: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
