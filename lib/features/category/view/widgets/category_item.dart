import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/category_model.dart';
import 'package:logging/logging.dart';

final log = Logger('CategoryItem');

class CategoryItem extends StatefulWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTap() {
    log.info('Tapped on ${widget.category.title}');

    // Haptic feedback for better UX
    // HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: _handleTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color:
                    _isPressed
                        ? widget.category.backgroundColor.withValues(alpha: 10)
                        : widget.category.backgroundColor,
                borderRadius: BorderRadius.circular(0),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    scale: _isPressed ? 0.9 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: SvgPicture.asset(
                      widget.category.iconPath,
                      height: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 150),
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight:
                          _isPressed ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 14,
                      color: _isPressed ? Colors.black87 : Colors.black54,
                    ),
                    child: Text(
                      widget.category.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
