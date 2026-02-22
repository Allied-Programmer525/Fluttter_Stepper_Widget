import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _cuurentStep = 0;

  // STEP CONTINUE //
  stepContinue(){
    if(_cuurentStep < 2){
      setState(() {
        _cuurentStep++;
      });
    }else{
      _showCompletedMessage();
    }
  }

  // STEP CANCEL //
  stepCancel(){
    if(_cuurentStep > 0){
      setState(() {
        _cuurentStep--;
      });
    }
  }

  // STEP CONTINUE //
  stepTap(int step){
    setState(() {
      _cuurentStep = step;
    });
  }

  void _showCompletedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All steps completed!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stepper Widget')),
      body: Stepper(
        onStepContinue: stepContinue,
        onStepCancel: stepCancel,
        currentStep: _cuurentStep,
        onStepTapped: stepTap,

        type: StepperType.horizontal,
        steps: [
          // Step - 1 //
          Step(
            isActive: _cuurentStep == 0,
            stepStyle: StepStyle(
              color: Colors.deepPurple,
            ),
            subtitle: Text('Info 1 '),
            title: Text('Question 1'),
            content: Text('Answer 1'),
          ),
          // Step - 2 //
          Step(
            isActive: _cuurentStep == 1,
            stepStyle: StepStyle(
                color: Colors.deepPurple,
            ),
            subtitle: Text('Info 2 '),
            title: Text('Question 2'),
            content: Text('Answer 2'),
          ),
          // Step - 3 //
          Step(
            isActive: _cuurentStep == 2,
            stepStyle: StepStyle(
                color: Colors.deepPurple,
            ),
            subtitle: Text('Info 3 '),
            title: Text('Question 3'),
            content: Text('Answer 3'),
          ),

        ],
      ),
    );
  }
}
