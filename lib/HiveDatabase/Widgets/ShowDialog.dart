import 'package:flutter/material.dart';

class CustomDialog {
  // Method to show the dialog
  static void showCustomDialog({
    required BuildContext context,
    final TextEditingController? primaryController,
    final TextEditingController? secondaryController,
    final String? lblTextName,
    final String? lblTextRol,
    required String subButtn,
    required String cancel,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                // Single TextFormField with optional controller usage
                TextFormField(
                  controller: primaryController,
                  decoration: InputDecoration(
                    labelText: lblTextName,
                  ),
                ),
                if (secondaryController != null) ...[
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: secondaryController,
                    decoration: InputDecoration(
                      labelText: lblTextRol,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () {
                          // Handle the submit action here
                        },
                        child: Text(subButtn),
                      ),
                      FilledButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          // Handle the cancel action here
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          cancel,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
