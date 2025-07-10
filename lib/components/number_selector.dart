import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onIncrement;
  final Function() onDecrease;

  const NumberSelector({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.onDecrease,
    required this.value,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(widget.title, style: TextStyles.bodyText),
            Text(widget.value.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    setState(() {
                      widget.onDecrease();
                    });
                  },
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.onIncrement();
                    });
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
