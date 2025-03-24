import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/helper/responsive.dart';
import 'package:foodtek_project/helper/validation.dart';
import 'package:foodtek_project/view/widgets/spin_kit_hour_glass_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../cubits/user_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/secure_storage_helper.dart';
import '../../states/user_state.dart';
import '../screens/authentication_screens/reset_password_screen.dart';

class VerificationCodeWidget extends StatefulWidget {
  final String email;
  final String otp;
  const VerificationCodeWidget({required this.email,required this.otp, Key? key})
    : super(key: key);

  @override
  State<VerificationCodeWidget> createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {

  Validation validation = Validation();

  @override
  void dispose() {
    validation.otpTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: responsiveWidth(context, 50.5),
      height: responsiveHeight(context, 46),
      textStyle: TextStyle(
        fontSize: responsiveHeight(context, 16),
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEDF1F3), width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3DE4E5E7),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state)async {
        if (state is VerifyOtpSuccessState) {
          await SecureStorageHelper.instance.savePrefString(key: "email", value: widget.email);
          await SecureStorageHelper.instance.savePrefString(key: "otp", value: widget.otp);
          debugPrint("✅ OTP verification successful!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordScreen(
                email: widget.email,
                otp: widget.otp,
              ),
            ),
          );
        } else if (state is VerifyOtpFailedState) {
          debugPrint("❌ OTP verification failed: ${state.errorMessage}");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Container(
          width: responsiveWidth(context, 343),
          height: responsiveHeight(context, 389),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: responsiveWidth(context, 153),
                height: responsiveHeight(context, 153),
                child: Image.asset(
                  'assets/images/Sent Message-rafiki 1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.verificationText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: responsiveHeight(context, 12),
                  letterSpacing: -0.01,
                  color: const Color(0xFF6C7278),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              Pinput(
                length: 4,
                controller: validation.otpTextEditingController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                enabled: !(state is UserLoadingState),
                autofocus: true,
                keyboardType: TextInputType.number,
                showCursor: true,
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              Container(
                width: responsiveWidth(context, 295),
                height: responsiveHeight(context, 48),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF25AE4B), Color(0xFF25AE4B)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x7A253EA7),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed:
                      state is UserLoadingState
                          ? null
                          : () {
                            context.read<UserCubit>().verifyOtp(
                            widget.email,
                              validation.otpTextEditingController.text,
                            );
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:
                      state is UserLoadingState
                          ? const SpinKitHourGlassWidget()
                          : Text(
                            AppLocalizations.of(context)!.verify,
                            style: GoogleFonts.inter(
                              fontSize: responsiveHeight(context, 14),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.01,
                              height: 1.4,
                            ),
                          ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
