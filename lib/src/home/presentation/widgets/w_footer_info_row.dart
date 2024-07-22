import 'package:flutter/material.dart';

import '../../../../app_base/config/app_config.dart';

class FooterInfoRow extends StatelessWidget {
  const FooterInfoRow({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title,
              style: AppStyles.text12.preReg
                  .copyWith(color: AppColors.homeFooterTextColor)),
        ),
        Expanded(
          flex: 7,
          child: Text(content,
              style: AppStyles.text12.preReg
                  .copyWith(color: AppColors.homeFooterTextColor)),
        )
      ],
    );
  }
}
