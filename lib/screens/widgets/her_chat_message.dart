import 'package:flutter/material.dart';

class HerChatMessage extends StatelessWidget {
  const HerChatMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Ad quis excepteur aliquip sunt Lorem duis ea",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),
        const _ImageBubble(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
            "https://yesno.wtf/assets/no/6-4bf0a784c173f70a0cab96efd9ff80c9.gif",
            width: size.width * .7,
            height: 150,
            fit: BoxFit.cover),
      ),
    );
  }
}
