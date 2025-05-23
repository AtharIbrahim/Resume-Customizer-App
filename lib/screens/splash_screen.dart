import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Stack(
        children: [
          // Background elements
          Positioned(
            top: -size.width * 0.2,
            right: -size.width * 0.2,
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo (replace with your own asset)
                // Hero(
                //   tag: 'app-logo',
                //   child: Image.asset(
                //     'assets/logo/logo.jpg', // Use your logo file
                //     width: size.width * 0.4,
                //     color: theme.colorScheme.onPrimary,
                //   ),
                // ),
                const SizedBox(height: 24),

                // App name with typography
                Text(
                  'ResumeAI',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 8),

                // Tagline
                Text(
                  'Tailored resumes in seconds',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 48),

                // Loading indicator
                const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ],
            ),
          ),

          // Version info at bottom
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Text(
              'v1.0.0',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
