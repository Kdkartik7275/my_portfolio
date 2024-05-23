import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/widgets/main_text.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function onNavMenuTap;

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeIn),
    ));

    _textOpacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.5,
      constraints: const BoxConstraints(
        minHeight: 300.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: _textOpacityAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: child,
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MainText(textSize: 30),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onNavMenuTap();
                    },
                    child: const Text(
                      "Get in touch",
                      style: TextStyle(color: CustomColor.whitePrimary),
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              "assets/my_flutter_avatar.png",
              width: screenWidth / 2,
            ),
          ),
        ],
      ),
    );
  }
}
