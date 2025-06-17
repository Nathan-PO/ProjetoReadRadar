import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final String userName;
  final void Function(String) onUserNameChanged;

  const SettingsScreen({
    super.key,
    required this.onToggleTheme,
    required this.userName,
    required this.onUserNameChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.userName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveName() {
    widget.onUserNameChanged(_controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nome atualizado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações'),
        backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Alternar Tema Claro/Escuro'),
              onTap: widget.onToggleTheme,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome de usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveName,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
