import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/auth_pages/forget_password_page.dart';
import 'package:store/pages/auth_pages/sign_up_page.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/root_of_pages.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/auth_methods.dart';
import 'package:store/widgets/auth_widgets/custom_auth_page.dart';
import 'package:store/widgets/auth_widgets/custom_divider.dart';
import 'package:store/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:store/widgets/auth_widgets/custom_elevated_button_with_icon.dart';
import 'package:store/widgets/auth_widgets/custom_google_button.dart';
import 'package:store/widgets/auth_widgets/custom_progress_indicator.dart';
import 'package:store/widgets/auth_widgets/custom_question.dart';
import 'package:store/widgets/custom_text_forms/email_text_form.dart';
import 'package:store/widgets/custom_text_forms/passwod_text_form.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static const String routName = '/log_in_page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _mailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _mailController.dispose();
    _passwordController.dispose();
    _mailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IsLoadingProvider isLoading = Provider.of<IsLoadingProvider>(context);
    final Color dividerColor2 = Theme.of(context).dividerColor;
    return ModalProgressHUD(
      progressIndicator: const CustomProgressIndicator(),
      inAsyncCall: isLoading.getLoadingState,
      opacity: 0.2,
      color: dividerColor2,
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Scaffold(
            appBar: CustomAppBar(
              title: '${ConstValues.authVariables["smartshop"]}',
              centerTitle: true,
            ),
            body: CustomAuthPage(
              children: [
                Center(
                  child: CustomText(
                    title: '${ConstValues.authVariables["email"]}',
                    fontSize: 20,
                  ),
                ),
                CustomText(
                  title: '${ConstValues.authVariables["email"]}',
                  fontSize: 16,
                ),
                EmailTextForm(
                  mailFocusNode: _mailFocusNode,
                  mailController: _mailController,
                  passwordFocusNode: _passwordFocusNode,
                ),
                CustomText(
                  title: '${ConstValues.authVariables["password"]}',
                  fontSize: 16,
                ),
                PasswordTextForm(
                    passwordFocusNode: _passwordFocusNode,
                    passwordController: _passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ForgetPasswordPage.routName),
                      child: CustomText(
                        title:
                            "${ConstValues.authVariables["forgetpassword"]}!",
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                IntrinsicWidth(
                  child: CustomElevatedButton(
                      textColor: Colors.white,
                      title: 'login',
                      authMethod: () async {
                        await AuthMethods.logInMethod(
                          isLoading: isLoading,
                          context: context,
                          formKey: _formKey,
                          email: _mailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }),
                ),
                CustomQuestion(
                  question: "Don`t have an account? ",
                  title: '${ConstValues.authVariables["signup"]}',
                  pageName: SignUpPage.routName,
                ),
                const CustomDivider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const CustomGoogleButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomElvatedButtonWithIcon(
                  icon: IconlyBroken.tickSquare,
                  iconColor: Colors.white,
                  title: 'Gust',
                  onPressed: () async {
                    auth.currentUser == null;
                    Navigator.pushReplacementNamed(
                        context, RootOfPages.routName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
