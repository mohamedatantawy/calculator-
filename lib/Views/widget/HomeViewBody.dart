import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:teshap/constant.dart';

class HomeviewBody extends StatefulWidget {
  const HomeviewBody({super.key});

  @override
  State<HomeviewBody> createState() => _HomeviewBodyState();
}

class _HomeviewBodyState extends State<HomeviewBody> {
  String input = '0.0';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                input,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            )),
        const SizedBox(
          height: 80,
        ),
        Expanded(
          flex: 4,
          child: GridView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (knum[index] == 'C') {
                    setState(() {
                      input = '';
                    });
                  } else if (knum[index] == 'Del') {
                    setState(() {
                      input = input.substring(0, input.length - 1);
                    });
                  } else if (knum[index] == '%' ||
                      knum[index] == '/' ||
                      knum[index] == '*' ||
                      knum[index] == '+' ||
                      knum[index] == '-') {
                    if (input.endsWith('%') ||
                        input.endsWith('/') ||
                        input.endsWith('*') ||
                        input.endsWith('+') ||
                        input.endsWith('-')) {
                      setState(() {
                        null;
                      });
                    } else {
                      setState(() {
                        input += knum[index];
                      });
                    }
                  } else if (knum[index] == '=') {
                    Expression ex = Parser().parse(input);

                      double eval = ex.evaluate(EvaluationType.REAL, ContextModel());
                    setState(() {
                      input = eval.toString();
                    });
                  } else {
                    setState(() {
                      input += knum[index];
                    });
                  }

                  //logic
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  child: Center(
                      child: Text(
                    knum[index],
                    style: const TextStyle(fontSize: 40),
                  )),
                ),
              );
            },
            itemCount: 20,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          ),
        )
      ],
    );
  }
}
