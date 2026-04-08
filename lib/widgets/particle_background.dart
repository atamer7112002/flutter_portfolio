import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Animated particle/dots background for hero section
class ParticleBackground extends StatefulWidget {
  final Widget child;

  const ParticleBackground({super.key, required this.child});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _particles = List.generate(60, (_) => _createParticle());
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  Particle _createParticle() {
    final colors = [
      AppColors.particleCyan,
      AppColors.particlePink,
      AppColors.particlePurple,
      AppColors.primary.withValues(alpha: 0.6),
    ];
    return Particle(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      size: _random.nextDouble() * 3 + 1,
      speedX: (_random.nextDouble() - 0.5) * 0.002,
      speedY: (_random.nextDouble() - 0.5) * 0.002,
      color: colors[_random.nextInt(colors.length)],
      opacity: _random.nextDouble() * 0.6 + 0.2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // widget.child is non-positioned → determines the Stack's size
        widget.child,
        // Positioned.fill stretches to match the Stack's resolved size,
        // giving CustomPaint finite constraints instead of Size.infinite.
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Update particle positions
                for (var p in _particles) {
                  p.x += p.speedX;
                  p.y += p.speedY;
                  if (p.x < 0 || p.x > 1) p.speedX *= -1;
                  if (p.y < 0 || p.y > 1) p.speedY *= -1;
                }
                return CustomPaint(painter: _ParticlePainter(_particles));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Particle {
  double x;
  double y;
  double size;
  double speedX;
  double speedY;
  Color color;
  double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.color,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color.withValues(alpha: particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
