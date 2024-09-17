import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTapped;
  final List<String> steps;

  const CustomStepper({
    Key? key,
    required this.currentStep,
    required this.onStepTapped,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(steps.length, (index) {
        bool isActive = index <= currentStep;
        bool isCompleted = index < currentStep;
        return Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => onStepTapped(index),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Color.fromARGB(255, 51, 204, 204)
                        : isActive
                            ? Colors.black
                            : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(Icons.check, color: Colors.white, size: 24)
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isActive
                                  ? Colors.white
                                  : Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                steps[index],
                style: TextStyle(
                  color: isCompleted ? Colors.black : Colors.grey[600],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
