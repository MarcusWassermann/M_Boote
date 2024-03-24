import 'package:flutter/material.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildSectionTitle('Kontaktformular'),
                  const SizedBox(height: 20),
                  _buildInputField('Name', TextInputType.text),
                  const SizedBox(height: 12),
                  _buildInputField('Telefonnummer', TextInputType.phone),
                  const SizedBox(height: 12),
                  _buildInputField('E-Mail', TextInputType.emailAddress),
                  const SizedBox(height: 12),
                  _buildInputField('Nachricht', TextInputType.multiline),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    child: const Text('Senden'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Image.asset(
          'assets/logo-transparent-png.png',
          height: 50,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _buildInputField(String labelText, TextInputType keyboardType) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Bitte geben Sie $labelText ein.';
          }
          return null;
        },
      ),
    );
  }

  void _handleSubmit() {
    // Handle form submission
    // Optional: Implement form validation logic here
  }
}
