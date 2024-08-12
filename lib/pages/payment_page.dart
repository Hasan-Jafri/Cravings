import 'package:cravings/components/my_button.dart';
import 'package:cravings/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHoldername = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  // User Wants to Pay

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Only show Dialog if form is valid
      showDialog(
          barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Confirm Payment"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card Number: $cardNumber"),
                      Text("Expiry Date: $expiryDate"),
                      Text("Card Holder Name: $cardHoldername"),
                      Text("CVV: $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  // Cancel Button
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  // Yes Button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryProgressPage()));
                      },
                      child: const Text("Yes"))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          leading: BackButton(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          title: Text(
            "Checkout",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Credit Card
                CreditCardWidget(
                  enableFloatingCard: true,
                  isChipVisible: true,
                  isHolderNameVisible: true,
                  height: 200,
                  width: 450,
                  cardType: CardType.mastercard,
                  cardBgColor: Color.fromARGB(255, 0, 127, 186),
                  cardHolderName: cardHoldername.toUpperCase(),
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (p0) {},
                ),

                // Credit Card Form
                CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHoldername,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: (data) {
                      setState(() {
                        cardNumber = data.cardNumber;
                        cardHoldername = data.cardHolderName;
                        expiryDate = data.expiryDate;
                        cvvCode = data.cvvCode;
                      });
                    },
                    formKey: formKey),

                const SizedBox(
                  height: 100,
                ),
                MyButton(onTap: userTappedPay, text: "Pay now"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
