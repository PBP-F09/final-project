part of '_globals.dart';

void showTopFlash(String teks, BuildContext context,
      {FlashBehavior style = FlashBehavior.floating,}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Flash(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: style,
          position: FlashPosition.top,
          child: FlashBar(
            title: const Text('Alert!', style: TextStyle(color: AppColors.merahTua)),
            content: Text(teks),
            showProgressIndicator: true,
            primaryAction: TextButton(
              onPressed: () => controller.dismiss(),
              child: const Text('DISMISS', style: TextStyle(color: AppColors.merahTua)),
            ),
          ),
        );
      },
    );
  }