import 'package:flutter/material.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog(
      {super.key,
      required this.dialogMessage,
      this.onPressed,
      this.isError,
      this.title1 = 'Cancel',
      this.title2 = 'Ok'});
  final String dialogMessage;
  final Future<void> Function()? onPressed;
  final bool? isError;
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: const OutlineInputBorder(
          borderRadius: ConstValues.borderRadius, borderSide: BorderSide.none),
      elevation: 5,
      contentPadding: const EdgeInsets.all(10),
      backgroundColor: Theme.of(context).dividerColor,
      title: Column(
        children: [
          Image.asset(
            AssetsManger.warning,
            width: MediaQuery.of(context).size.height * 0.06,
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.06,
          ),
          CustomText(
            title: dialogMessage,
            fontSize: 15,
            textAlign: TextAlign.center,
            color: Theme.of(context).scaffoldBackgroundColor,
          )
        ],
      ),
      actions: [
        isError == false
            ? OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: ConstValues.borderRadius,
                    side: BorderSide.none,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: CustomText(
                  title: title1,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width * (0.001),
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (0.04),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: ConstValues.borderRadius,
            ),
          ),
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: CustomText(
            title: title2,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}
