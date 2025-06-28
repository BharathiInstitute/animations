import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//potti
//kanna
//pooj
//cat
//jyo
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedTextWithTween(),
        ),
      ),
    );
  }
}

class AnimatedTextWithTween extends StatefulWidget {
  const AnimatedTextWithTween({super.key});

  @override
  State<AnimatedTextWithTween> createState() => _AnimatedTextWithTweenState();
}

class _AnimatedTextWithTweenState extends State<AnimatedTextWithTween>
    with SingleTickerProviderStateMixin {
  bool _selected = false;
  late AnimationController _controller;
  late Animation<double> _opacityAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after build
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _selected = true;
        _controller.forward();
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true, // Always show scrollbar (optional)
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple text widget
            Text(
              'Welcome to Animations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),

            // Another simple text widget
            Text(
              'Flutter Animations Demo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade600,
              ),
            ),
            SizedBox(height: 15),

            // Third text widget
            Text(
              'Amazing Text Effects!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.purple.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),

            // Fourth text widget
            Text(
              'Explore Beautiful Animations',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.green.shade600,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 25),

            // Fifth text widget
            Text(
              'Creative Text Showcase',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.orange.shade700,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 20),

            // GestureDetector for Hero Animation
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HeroSecondPage(),
                  ),
                );
              },
              child: Hero(
                tag: 'hero-text',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'Tap for Hero Animation',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.pink.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Existing animated text style
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 3),
              style: _selected
                  ? const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
              child: const Text('lavanya'),
            ),

            // Slide animation using TweenAnimationBuilder
            TweenAnimationBuilder<Offset>(
              tween: Tween<Offset>(
                begin: const Offset(-1.5, 0), // Start off-screen to the left
                end: _selected ? Offset.zero : const Offset(-1.5, 0),
              ),
              duration: const Duration(seconds: 4),
              curve: Curves.easeInOut,
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: Offset(offset.dx * 200, 0), // Slide horizontally
                  child: child,
                );
              },
              child: const Text(
                'Sneha',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),

            // Scale animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.5, // Start at half size
                end: _selected ? 1.0 : 0.5, // Animate to full size
              ),
              duration: const Duration(seconds: 3),
              curve: Curves.elasticOut,
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: const Text(
                'kanaka pooja',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
            ),

            // Rotate animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0, // Start angle (radians)
                end: _selected ? 2 * 3.1416 : 0.0, // One full rotation
              ),
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              builder: (context, angle, child) {
                return Transform.rotate(
                  angle: angle,
                  child: child,
                );
              },
              child: const Text(
                'Rotating  daddy Text',
                style: TextStyle(fontSize: 20, color: Colors.purple),
              ),
            ),

            // Color transition animation using TweenAnimationBuilder
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: Colors.orange,
                end: _selected ? Colors.teal : Colors.orange,
              ),
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              builder: (context, color, child) {
                return Text(
                  'Color Transition Text',
                  style: TextStyle(fontSize: 20, color: color),
                );
              },
            ),

            // Another text style changes animation using AnimatedDefaultTextStyle
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              style: _selected
                  ? const TextStyle(
                      fontSize: 28,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    )
                  : const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0,
                    ),
              child: const Text('radha krishna'),
            ),

            // Custom animation using AnimatedBuilder
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnim.value,
                  child: Transform.scale(
                    scale: _scaleAnim.value,
                    child: child,
                  ),
                );
              },
              child: const Text(
                'Custom jyo',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Fade & Slide animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: _selected ? 1.0 : 0.0,
              ),
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - value)), // Slides up as it fades in
                    child: child,
                  ),
                );
              },
              child: const Text(
                'Fade & Slide Text',
                style: TextStyle(fontSize: 20, color: Colors.brown, fontWeight: FontWeight.bold),
              ),
            ),

            // Glow animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: _selected ? 30.0 : 0.0, // Glow radius
              ),
              duration: const Duration(seconds: 5),
              curve: Curves.easeInOut,
              builder: (context, glow, child) {
                return Text(
                  'amma',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: glow,
                        color: Colors.cyanAccent,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Cross fade animation using AnimatedCrossFade
            AnimatedCrossFade(
              duration: const Duration(seconds: 2),
              crossFadeState: _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: const Text(
                'navaneetha (CrossFade)',
                style: TextStyle(fontSize: 22, color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              secondChild: const Text(
                'nandhu (CrossFade)',
                style: TextStyle(fontSize: 22, color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),

            // Transform (rotate + scale) animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: _selected ? 1.0 : 0.0,
              ),
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOutBack,
              builder: (context, value, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateZ(value * 3.1416) // Rotates 180 degrees
                    ..scale(0.5 + value * 0.5), // Scales from 0.5 to 1.0
                  child: child,
                );
              },
              child: const Text(
                'Transform Animation',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            ),

            // Padding animation using AnimatedPadding
            AnimatedPadding(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              padding: _selected
                  ? const EdgeInsets.symmetric(horizontal: 60, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: const Text(
                'nandhuPadding Text',
                style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),

            // Align animation using AnimatedAlign
            AnimatedAlign(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              alignment: _selected ? Alignment.centerRight : Alignment.centerLeft,
              child: const Text(
                'hemaluu',
                style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ),

            // Bouncing animation using TweenAnimationBuilder
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: _selected ? 1.0 : 0.0,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.bounceOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 100 * (1 - value)), // Bounces up from below
                  child: Transform.scale(
                    scale: 0.5 + 0.5 * value, // Scales from 0.5 to 1.0
                    child: child,
                  ),
                );
              },
              child: const Text(
                'Bouncing sidhu Text',
                style: TextStyle(fontSize: 20, color: Colors.lime, fontWeight: FontWeight.bold),
              ),
            ),

            // Typewriter animation using AnimatedTextKit
            SizedBox(
              width: 250,
              child: AnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'TypewriterNandhu!',
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
            ),

            // Outlined text animation using TweenAnimationBuilder
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: Colors.red,
                end: _selected ? Colors.blue : Colors.red,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, color, child) {
                return Text(
                  'lakshmi',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = color ?? Colors.red,
                  ),
                );
              },
            ),

            // Ways animation using AnimatedSwitcher
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: _selected
                    ? const Text(
                        'dad',
                        key: ValueKey('dad'),
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'nani 2',
                        key: ValueKey('nani'),
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            // Another switch animation using AnimatedSwitcher (FadeTransition)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: _selected
                    ? const Text(
                        'uma',
                        key: ValueKey('uma'),
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'divya',
                        key: ValueKey('divya'),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            // Letter spacing animation using AnimatedDefaultTextStyle
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              style: _selected
                  ? const TextStyle(
                      fontSize: 28,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 16,
                    )
                  : const TextStyle(
                      fontSize: 28,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
              child: const Text('krishna'),
            ),

            // Button to trigger custom page transition
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createFadeRoute());
              },
              child: const Text('Go to Fade Page'),
            ),

            // Continuously pulsing animated text
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // The value goes from 0.0 to 1.0, so we map it to a scale between 1.0 and 1.2
                double scale = 1.0 + 0.2 * (0.5 - (0.5 - _controller.value).abs());
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: const Text(
                'Continuously Animated!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createFadeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const FadePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

// Hero second page for Hero animation
class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(title: const Text('Hero Animation')),
      body: Center(
        child: Hero(
          tag: 'hero-text',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'Tap for Hero Animation',
              style: TextStyle(
                fontSize: 48,
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Fade page for custom page transition
class FadePage extends StatelessWidget {
  const FadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(title: const Text('Fade Page')),
      body: Center(
        child: Text(
          'Welcome to the Fade Page',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
