import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/auth_methods.dart';
import 'package:store/widgets/auth_widgets/custom_auth_page.dart';
import 'package:store/widgets/auth_widgets/custom_elevated_button_with_icon.dart';
import 'package:store/widgets/auth_widgets/custom_progress_indicator.dart';
import 'package:store/widgets/custom_text_forms/email_text_form.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  static const String routName = '/forget_password_page';

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _mailController = TextEditingController();
  final FocusNode _mailFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _mailController.dispose();
    _mailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IsLoadingProvider isLoading = Provider.of<IsLoadingProvider>(context);
    final double size = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      progressIndicator: const CustomProgressIndicator(),
      inAsyncCall: isLoading.getLoadingState,
      opacity: 0.2,
      color: Theme.of(context).dividerColor,
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: ShimmerText(
                child: CustomText(
                  title: '${ConstValues.authVariables["smartshop"]}',
                  fontSize: 20,
                ),
              ),
            ),
            body: CustomAuthPage(
              children: [
                CustomText(
                  title: '${ConstValues.authVariables["forgetpassword"]}',
                  fontSize: 20,
                ),
                CustomText(
                  title: '${ConstValues.authVariables['resethintmessage']}',
                  fontSize: 14,
                ),
                Image.asset(
                  AssetsManger.forgotPassword,
                  height: size * 0.5,
                  width: size * 0.5,
                ),
                EmailTextForm(
                    mailFocusNode: _mailFocusNode,
                    mailController: _mailController),
                CustomElvatedButtonWithIcon(
                  icon: IconlyBold.send,
                  title: '${ConstValues.authVariables['requestlink']}',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  onPressed: () async {
                    await AuthMethods.forgetPasswordMethod(
                      isLoading: isLoading,
                      context: context,
                      email: _mailController.text.trim(),
                      formKey: _formKey,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
