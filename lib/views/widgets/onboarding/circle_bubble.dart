part of '_onboarding.dart';

class CircleBubble extends StatelessWidget {
  const CircleBubble({super.key, required this.widthScreen, required this.dx, required this.dy, required this.radius});

  final double widthScreen;
  final double dx;
  final double dy;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset(dx, dy),
      child: SizedBox(
        width: radius,
        height: radius,
        child: CustomPaint(
          size: Size(
            widthScreen,
            (widthScreen * 1.7727272727272727).toDouble(),
          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width * 1.097403, size.height * 0.1666670),
      Offset(size.width * 0.4058442, size.height * 0.8974359),
      [
        const Color(0xffE06767).withOpacity(1),
        const Color(0xffB73E3E).withOpacity(1)
      ],
      [0, 1],
    );
    canvas.drawCircle(
      Offset(size.width * 0.8863636, size.height * 0.5000000),
      size.width * 0.8798701,
      paint0Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
