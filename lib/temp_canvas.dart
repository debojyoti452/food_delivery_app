import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

final _circleColor = Color(0xFF3B3A5A);
final _bgColor = Color(0xFF19173D);

final _greenColor = <Color>[
  Color(0xFF22FA00),
  Color(0xFF15670C),
  Color(0xFF44A15F),
  Color(0xFFEA4335),
  Color(0xFF22FA00),
];

final _blueColor = [
  Color(0xFF011EFD),
  Color(0xFF6B83FA),
  Color(0xFF1135F8),
  Color(0xFFEA4335),
  Color(0xFF011EFD),
];

final _violetColor = [
  Color(0xFF00167A),
  Color(0xFF00167A),
  Color(0xFF863BBB),
  Color(0xFFEA4335),
  Color(0xFFA300FF),
];

class TempCanvas extends StatefulWidget {
  const TempCanvas({Key? key}) : super(key: key);

  @override
  State<TempCanvas> createState() => _TempCanvasState();
}

class _TempCanvasState extends State<TempCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _downloadAnim;
  final duration = const Duration(seconds: 20);

  @override
  void initState() {
    _downloadAnim = AnimationController(duration: duration, vsync: this)
      ..addListener(() => setState(() {}))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _downloadAnim.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _downloadAnim.forward();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Canvas'),
        centerTitle: true,
      ),
      backgroundColor: _bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: CircularWave(
            _circleColor,
            2,
            StrokeCap.round,
            downloadProgress: _downloadAnim.value,
          ),
        ),
      ),
    );
  }
}

class CircularWave extends CustomPainter {
  const CircularWave(
    this.color,
    this.strokeWidth,
    this.strokeCap, {
    this.downloadProgress = 0.0,
  });

  final Color color;
  final double strokeWidth;
  final StrokeCap strokeCap;
  final double? downloadProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    drawRoundedOuter(canvas, size, paint);
    drawInnerArc(canvas, size, paint, downloadProgress ?? 0.0);
  }

  void drawInnerArc(
    Canvas canvas,
    Size size,
    Paint paint,
    double downloadProgress,
  ) {
    final center = Offset(size.width / 2, size.height / 2);

    final rect = Rect.fromCenter(center: center, width: 170, height: 170);

    final colorRect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    final Gradient greenGrad = SweepGradient(
      center: FractionalOffset.center,
      colors: _greenColor,
      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
      startAngle: 0.0,
      endAngle: math.pi * 2,
    );

    final Gradient blueGrad = SweepGradient(
      center: FractionalOffset.center,
      colors: _blueColor,
      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
      startAngle: 0.0,
      endAngle: math.pi * 2,
    );

    final Gradient violetGrad = SweepGradient(
      center: FractionalOffset.center,
      colors: _violetColor,
      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
      startAngle: 0.0,
      endAngle: math.pi * 2,
    );

    final greenPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = greenGrad.createShader(colorRect)
      ..strokeWidth = 28;

    final bluePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = blueGrad.createShader(colorRect)
      ..strokeWidth = 28;

    final violetPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = violetGrad.createShader(colorRect)
      ..strokeWidth = 28;

    canvas.drawArc(
      rect,
      vmath.radians(-20),
      vmath.radians(60),
      false,
      greenPaint,
    );

    canvas.drawArc(
      rect,
      vmath.radians(30),
      vmath.radians(80),
      false,
      bluePaint,
    );

    canvas.drawArc(
      rect,
      vmath.radians(90),
      vmath.radians(80),
      false,
      violetPaint,
    );
  }

  void drawRoundedOuter(Canvas canvas, Size size, Paint paint) {
    final center = Offset(size.width / 2, size.height / 2);

    // Concentric circles
    var concentricCircleRadius = 100.0;
    while (concentricCircleRadius > 50) {
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 30;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
