import 'package:flutter/material.dart';

class StepperApplication extends StatefulWidget {
  const StepperApplication({super.key});

  @override
  State<StepperApplication> createState() => _StepperApplicationState();
}

class _StepperApplicationState extends State<StepperApplication> {
  int _currentStep = 0;

  // ✅ Separate form keys for each step
  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();
  final _formKeyStep3 = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ✅ Continue UDF
  void _handleContinue() {
    if (_currentStep == 0 && _formKeyStep1.currentState!.validate()) {
      setState(() => _currentStep++);
    }
    else if (_currentStep == 1 && _formKeyStep2.currentState!.validate()) {
      setState(() => _currentStep++);
    }
    else if (_currentStep == 2 && _formKeyStep3.currentState!.validate()) {
      _goToDashboard();
    }
  }

  // ✅ Cancel UDF
  void _handleCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  // ✅ Step Tap UDF
  void _handleStepTapped(int step) {
    setState(() => _currentStep = step);
  }

  // ✅ Navigate to Dashboard
  void _goToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          name: _nameController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stepper Form Example")),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _handleContinue,
        onStepCancel: _handleCancel,
        onStepTapped: _handleStepTapped,
        steps: [
          Step(
            title: const Text("Name"),
            isActive: _currentStep == 0,
            content: Form(
              key: _formKeyStep1,
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Enter Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
            ),
          ),
          Step(
            title: const Text("Email"),
            isActive: _currentStep == 1,
            content: Form(
              key: _formKeyStep2,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Enter Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains('@')) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),
            ),
          ),
          Step(
            title: const Text("Password"),
            isActive: _currentStep == 2,
            content: Form(
              key: _formKeyStep3,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Enter Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Minimum 6 characters required";
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final String name;

  const DashboardScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: Text(
          "Welcome, $name!",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}