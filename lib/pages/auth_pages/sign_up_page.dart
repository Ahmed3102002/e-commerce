import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/auth_pages/log_in_page.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/auth_methods.dart';
import 'package:store/widgets/auth_widgets/custom_auth_page.dart';
import 'package:store/widgets/auth_widgets/custom_divider.dart';
import 'package:store/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:store/widgets/auth_widgets/custom_google_button.dart';
import 'package:store/widgets/auth_widgets/custom_progress_indicator.dart';
import 'package:store/widgets/auth_widgets/custom_question.dart';
import 'package:store/widgets/auth_widgets/new_user_image.dart';
import 'package:store/widgets/custom_text_forms/confirm_password_text_form.dart';
import 'package:store/widgets/custom_text_forms/email_text_form.dart';
import 'package:store/widgets/custom_text_forms/name_text_form.dart';
import 'package:store/widgets/custom_text_forms/passwod_text_form.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routName = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _mailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  ImagePicker image = ImagePicker();
  XFile? _pickedImage;
  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _mailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color dividerColor2 = Theme.of(context).dividerColor;
    final IsLoadingProvider isLoading = Provider.of<IsLoadingProvider>(context);
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
              title: 'Welcome to ${ConstValues.authVariables['smartshop']}',
              centerTitle: true,
            ),
            body: CustomAuthPage(
              children: [
                Center(
                  child: CustomText(
                    title: '${ConstValues.authVariables['signup']}',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                NewUserImage(
                  title: 'Choose option',
                  pickedImage: _pickedImage,
                  onPressedRemove: () {
                    setState(() {
                      _pickedImage = null;
                    });
                    Navigator.pop(context);
                  },
                  onPressedCamera: () async {
                    setState(() async {
                      _pickedImage =
                          await image.pickImage(source: ImageSource.camera);
                    });
                    Navigator.pop(context);
                  },
                  onPressedGallery: () async {
                    setState(() async {
                      _pickedImage =
                          await image.pickImage(source: ImageSource.gallery);
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomText(
                  title: '${ConstValues.authVariables['name']}',
                  fontSize: 16,
                ),
                NameTextForm(
                  mailFocusNode: _mailFocusNode,
                  nameFocusNode: _nameFocusNode,
                  nameController: _nameController,
                ),
                CustomText(
                  title: '${ConstValues.authVariables['email']}',
                  fontSize: 16,
                ),
                EmailTextForm(
                  passwordFocusNode: _passwordFocusNode,
                  mailFocusNode: _mailFocusNode,
                  mailController: _mailController,
                ),
                CustomText(
                  title: '${ConstValues.authVariables["password"]}',
                  fontSize: 16,
                ),
                PasswordTextForm(
                  confirmPasswordFocusNode: _confirmPasswordFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                  passwordController: _passwordController,
                ),
                CustomText(
                  title: "Confirm ${ConstValues.authVariables["password"]}",
                  fontSize: 16,
                ),
                ConfirmPasswordTextForm(
                  passwordController: _passwordController,
                  confirmPasswordFocusNode: _confirmPasswordFocusNode,
                  confirmPasswordController: _confirmPasswordController,
                ),
                CustomElevatedButton(
                    textColor: Colors.white,
                    title: 'signup',
                    authMethod: () async {
                      await AuthMethods.signUpMethod(
                        name: _nameController.text.trim(),
                        isLoading: isLoading,
                        context: context,
                        formKey: _formKey,
                        pickedImage: _pickedImage,
                        email: _mailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    }),
                CustomQuestion(
                  question: "I have an account? ",
                  title: ' ${ConstValues.authVariables['login']}',
                  pageName: LogInPage.routName,
                ),
                const CustomDivider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const CustomGoogleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
