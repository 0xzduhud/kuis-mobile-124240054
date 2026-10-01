import 'package:flutter/material.dart';
import 'package:kuis/data/data.dart';
import 'package:kuis/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(
              'https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ',
              height: 200,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'ERROR: $error',
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username dan password wajib diisi'),
                    ),
                  );
                  return;
                }
                if (username != username || password != password) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username atau password salah'),
                    ),
                  );
                  return;
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      username: username,
                      displayName: "Admin UNIQLO",
                    ),
                  ),
                );
              },
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
