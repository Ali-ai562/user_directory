import 'package:flutter/material.dart';
import 'package:user_directory/utils/app_colors.dart';

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({super.key});

  @override
  State<ShimmerCard> createState() => ShimmerCardState();
}

class ShimmerCardState extends State<ShimmerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Avatar shimmer
                  _ShimmerBox(
                    width: 56,
                    height: 56,
                    radius: 28,
                    anim: _anim,
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ShimmerBox(
                          width: 140,
                          height: 14,
                          radius: 6,
                          anim: _anim,
                        ),
                        const SizedBox(height: 8),
                        _ShimmerBox(
                          width: 200,
                          height: 11,
                          radius: 6,
                          anim: _anim,
                        ),
                      ],
                    ),
                  ),
                  _ShimmerBox(
                    width: 34,
                    height: 34,
                    radius: 10,
                    anim: _anim,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(height: 1, thickness: 0.5, color: AppColors.border),
              const SizedBox(height: 12),
              Row(
                children: [
                  _ShimmerBox(width: 100, height: 24, radius: 20, anim: _anim),
                  const SizedBox(width: 8),
                  _ShimmerBox(width: 90, height: 24, radius: 20, anim: _anim),
                  const SizedBox(width: 8),
                  _ShimmerBox(width: 80, height: 24, radius: 20, anim: _anim),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Animation<double> anim;

  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.radius,
    required this.anim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const [
            Color(0xFFE5E7EB),
            Color(0xFFF3F4F6),
            Color(0xFFE5E7EB),
          ],
          stops: [
            (anim.value - 0.3).clamp(0.0, 1.0),
            anim.value.clamp(0.0, 1.0),
            (anim.value + 0.3).clamp(0.0, 1.0),
          ],
        ),
      ),
    );
  }
}