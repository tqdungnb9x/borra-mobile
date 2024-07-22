import 'package:flutter/material.dart';

class AppReviewPrompt extends StatefulWidget {
  const AppReviewPrompt({
    super.key,
    required this.onReview,
    required this.onLater,
  });
  final Function() onReview;
  final Function() onLater;
  @override
  State<AppReviewPrompt> createState() => _AppReviewPromptState();
}

class _AppReviewPromptState extends State<AppReviewPrompt> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        widget.onLater();
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black54),
          ),
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                widget.onReview();
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset("assets/images/img_app_review.jpg")),
            ),
          ),
        ],
      ),
    );
  }
}
