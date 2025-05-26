import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/profile_model.dart';

class ProfileMenuItemWidget extends StatefulWidget {
  final ProfileMenuItem menuItem;

  const ProfileMenuItemWidget({super.key, required this.menuItem});

  @override
  State<ProfileMenuItemWidget> createState() => _ProfileMenuItemWidgetState();
}

class _ProfileMenuItemWidgetState extends State<ProfileMenuItemWidget>
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
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.menuItem.hasSwitch) {
      setState(() => _isPressed = true);
      _animationController.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.menuItem.hasSwitch) {
      setState(() => _isPressed = false);
      _animationController.reverse();
    }
  }

  void _handleTapCancel() {
    if (!widget.menuItem.hasSwitch) {
      setState(() => _isPressed = false);
      _animationController.reverse();
    }
  }

  void _handleTap() {
    if (!widget.menuItem.hasSwitch && widget.menuItem.onTap != null) {
      widget.menuItem.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.menuItem.hasSwitch ? 1.0 : _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: _handleTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: _isPressed
                    ? Colors.grey.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  AnimatedScale(
                    scale: _isPressed ? 0.95 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: SvgPicture.asset(
                      widget.menuItem.iconPath,
                      height: 24,
                      width: 24,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 150),
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: _isPressed ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 14,
                        color: _isPressed ? Colors.black87 : Colors.grey.shade700,
                      ),
                      child: Text(widget.menuItem.title),
                    ),
                  ),
                  if (widget.menuItem.hasSwitch)
                    AnimatedScale(
                      scale: 1.0,
                      duration: const Duration(milliseconds: 150),
                      child: Switch(
                        value: widget.menuItem.switchValue ?? false,
                        onChanged: widget.menuItem.onSwitchChanged,
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey.shade400,
                        inactiveTrackColor: Colors.grey.shade300,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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