import 'package:flutter/material.dart';
import 'package:side_project/utils/p_colors.dart';

class AlertBox extends StatefulWidget {
  final String ruleNum;
  final String ruleText;
  final bool completed;
  const AlertBox(
      {super.key,
      required this.ruleNum,
      required this.ruleText,
      required this.completed});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    final Color color = (!widget.completed) ? redBg : greenBg;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 3),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Row(
              children: [
                Icon((widget.completed) ? Icons.check : Icons.close,
                    color: (widget.completed) ? Colors.green : Colors.red),
                const SizedBox(width: 10),
                Expanded(child: Text('Rule ${widget.ruleNum}')),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.5)),
            child: Text(widget.ruleText),
          ),
        ],
      ),
    );
  }
}
