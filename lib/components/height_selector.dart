import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double newHeight) onHeightChange;

  const HeightSelector(
      {super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundComponent,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 7),
          child: Column(
            children: [
              const Text(
                "Altura",
                style: TextStyles.bodyText,
              ),
              Text(
                "${widget.selectedHeight.toStringAsFixed(0)} cm",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
              Slider(
                value: widget.selectedHeight,
                onChanged: (newHeight) {
                  setState(() {
                    widget.onHeightChange(newHeight);
                  });
                },
                min: 150,
                max: 220,
                divisions: 70,
                label: widget.selectedHeight.toStringAsFixed(0),
                activeColor: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
