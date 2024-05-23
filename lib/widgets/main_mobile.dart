import 'package:flutter/material.dart';
import 'package:my_portfoilio/utils/colors.dart';
import 'package:my_portfoilio/widgets/main_text.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({
    super.key,
    required this.onNavMenuTap,
  });
  final Function onNavMenuTap;

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
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
      curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
    ));

    _textOpacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
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
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
      height: screenHeight / 1.8,
      constraints: const BoxConstraints(
        minHeight: 500.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child:
                    Transform.scale(scale: _scaleAnimation.value, child: child),
              );
            },
            child: Image.asset(
              "assets/my_flutter_avatar.png",
              width: screenWidth,
            ),
          ),
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
              children: [
                const MainText(textSize: 24),
                const SizedBox(height: 15),
                SizedBox(
                  width: 190.0,
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
        ],
      ),
    );
  }
}
