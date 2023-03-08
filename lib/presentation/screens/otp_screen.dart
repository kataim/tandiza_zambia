import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/widgets/pin_put_widget.dart';

import '../../widgets/otp_header_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phoneNumber,
  this.clientFinancialData,
  this.clientId,
  this.firstName,
  this.surname,
    this.result,
  this.nrcNumber,
  this.dateOfBirth});

  static const String id = 'otp_screen';
  final String ? phoneNumber;
  final TandizaClientFinancialsModel ? clientFinancialData;
  final int ? clientId;
  final String ? firstName;
  final String ? surname;
  final String ? nrcNumber;
  final String ? dateOfBirth;
  final String ? result;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Verification'),
      centerTitle: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          children: [
            OtpHeader(),
            const FilledRoundedPinPut(),
            const SizedBox(height: 44),
            Text(
              'Didn’t receive code?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
            Text(
              'Resend',
              style: GoogleFonts.poppins(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
