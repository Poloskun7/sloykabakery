import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final IconData iconData;
  final String error;
  final String message;
  final VoidCallback onRetry;
  final String buttonText;

  const ErrorScreen({super.key, required this.iconData, required this.error, required this.message, required this.onRetry, required this.buttonText,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 64, color: const Color.fromARGB(255, 186, 38, 72)),
              const SizedBox(height: 24),
              Text(
                error,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(message),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: onRetry,
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}