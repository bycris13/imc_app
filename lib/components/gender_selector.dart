import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Hombre";
              });
            },
            onLongPress: () {
              setState(() {
                selectedGender = null;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 8, left: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: selectedGender == "Hombre"
                        ? AppColors.backgroundComponentSelected
                        : AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      Text("Hombre".toUpperCase(), style: TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Mujer
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = "Mujer";
            });
          },
          onLongPress: () {
            setState(() {
              selectedGender = null;
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: selectedGender == "Mujer"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset("assets/images/female.png", height: 100),
                    Text(
                      "Mujer".toUpperCase(),
                      style: TextStyles.bodyText,
                    )
                  ],
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
