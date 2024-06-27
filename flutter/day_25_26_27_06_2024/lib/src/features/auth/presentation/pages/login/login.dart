import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/config/theme/style.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/appbar.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/background_filter.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/elevated_button.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../../core/common/animations/fade.dart';
import '../../../../../core/constants/size.dart';
import '../../bloc/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          padding: hAppDefaultPaddingL,
          alignment: Alignment.center,
          child: HBlurCircleIcon(
              onTap: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HBlurCircleIcon(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  )),
              gapW16,
            ],
          )
        ],
      ),

      body: _buildBackgroundImage(context),
    );
  }

  Widget _buildFormLoginAndBottomText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        gapH16,
        _buildFormLogin(context),
        gapH100,
        _buildBottomText(context),
        gapH16,
      ],
    );
  }

  Widget _buildTitle() {
    return const HFadeAnimation(
      delay: 1,
      child: Text('Log in', style: HAppStyle.heading2Style),
    );
  }

  _buildFormLogin(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Form(
          child: Column(
        children: [
          const HFadeAnimation(
              delay: 1.2,
              child: HTextFormField(
                icon: Icon(
                  Icons.email_rounded,
                  size: 20,
                  color: HAppColor.greyColor,
                ),
                hintText: 'Email',
              )),
          gapH10,
          const HFadeAnimation(
            delay: 1.3,
            child: HTextFormField(
              icon: Icon(
                Icons.lock,
                size: 20,
                color: HAppColor.greyColor,
              ),
              isPassword: true,
              hintText: 'Password',
            ),
          ),
          gapH24,
          HFadeAnimation(
            delay: 1.4,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return SizedBox(
                  height: 50,
                  width: width,
                  child: HElevatedButton(
                      onPressed: () async {
                        state is AuthLoadingState ? null : login(context);
                      },
                      child: state is AuthLoadingState
                          ? const CircularProgressIndicator(
                              color: HAppColor.whileColor,
                            )
                          : const Text('Login')),
                );
              },
            ),
          ),
          gapH10,
          const HFadeAnimation(
            delay: 1.5,
            child: Text(
              'Forgot the password?',
              style: HAppStyle.paragraph2Regular,
            ),
          )
        ],
      )),
    );
  }

  Future<void> login(BuildContext context) async {
    context.loaderOverlay.show();
    context.read<AuthBloc>().add(const Login());
    if (context.loaderOverlay.visible) {
      await Future.delayed(const Duration(seconds: 3));
      if (!context.mounted) return;
      context.loaderOverlay.hide();
      Navigator.pushNamed(context, '/Process');
    }
  }

  _buildBottomText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/SignUp');
      },
      child: HFadeAnimation(
        delay: 1.6,
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: HAppStyle.paragraph2Regular),
              TextSpan(
                  text: 'Sign Up',
                  style: HAppStyle.label3Bold
                      .copyWith(color: HAppColor.bluePrimaryColor)),
            ],
          ),
        ),
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 355,
          backgroundColor: HAppColor.otherColor,
          leading: const SizedBox(),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_welcome.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                      HAppColor.otherColor,
                      HAppColor.otherColor.withOpacity(.3)
                    ])),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: hAppDefaultPaddingLTRB,
                    child: _buildTitle(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: hAppDefaultPaddingLTRB,
              child: _buildFormLoginAndBottomText(context),
            )
          ]),
        )
      ],
    );
  }
}
