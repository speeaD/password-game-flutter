import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:side_project/models/game_question.dart';
import 'package:side_project/providers/game_provider.dart';
import 'package:side_project/widgets/alert_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.network(
                'https://neal.fun/password-game/title.svg',
                height: 20,
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please choose a password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      visible = true;
                    });
                    Provider.of<GameProvider>(context, listen: false)
                        .setRule1(text);
                  },
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      1,
                      (i) =>
                          Consumer<GameProvider>(builder: (context, value, _) {
                            return Visibility(
                              visible: visible,
                              child: AlertBox(
                                ruleNum: '${i + 1}',
                                ruleText: questions[i].question,
                                completed: value.rule1,
                              ),
                            );
                          })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
