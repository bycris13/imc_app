import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  final int age;
  const ImcResultScreen(
      {super.key,
      required this.height,
      required this.age,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    double result = weight / ((height / 100) * (height / 100));

    String? getImcResults(double imc) {
      if (imc < 18.5) return 'Bajo de peso';
      if (imc < 25) return 'Peso normal';
      if (imc < 30) return 'Sobre peso';
      return 'obesidad';
    }

    String? getAdvice(double imc) {
      if (imc < 18.5)
        return 'Considera consultar a un especialista para ganar peso.';
      if (imc < 25) return 'Mantén un estilo de vida saludable.';
      if (imc < 30) return 'Considera ajustes en dieta y ejercicio.';
      return 'Tienes obesidad, consulta con un especialista.';
    }

    Color getColorResult(double imc) {
      if (imc < 18.5) return Colors.amberAccent;
      if (imc < 25) return Colors.green;
      if (imc < 30) return Colors.red;
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment(-1, 0),
              child: Text(
                'Tu resultado',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32, bottom: 32, left: 16, right: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      getImcResults(result).toString(),
                      style: TextStyle(
                          color: getColorResult(result),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        result.toStringAsFixed(2),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        getAdvice(result).toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 50)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.primary)),
                    child: const Text(
                      'Finalizar',
                      style: TextStyles.bodyText,
                    ))),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: const Text("Result"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}
