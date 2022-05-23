import 'package:flutter/material.dart';
import 'package:microtex/microtex.dart';

_buildCmp() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _buildRow(
        'render by text',
        () => const Text(
          'Hello World!',
          style: TextStyle(fontSize: 100, fontFamily: 'XITS Math'),
        ),
      ),
      _buildRow(
        'render by path with blur filter',
        () => const LaTeX(
          latex: "\\text{Hello World!}",
          textSize: 100,
          style: TeXStyle.text,
          color: Colors.black,
          blur: Blur(BlurStyle.normal, 0.5),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      _buildRow(
        'render by path without blur filter',
        () => const LaTeX(
          latex: "\\text{Hello World!}",
          textSize: 100,
          style: TeXStyle.text,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 50),
      _buildRichText(),
    ],
  );
}

_buildRow(String desc, Widget Function() build) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 150,
        child: Text(
          desc,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      const SizedBox(width: 10),
      build(),
    ],
  );
}

_buildRichText() {
  return RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: "Hello!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'XITS Math',
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: LaTeX(
            latex: "F(\\omega)=\\int_{-\\infty}^{+\\infty}f(t)e^{-i\\omega_nt}dt",
            textSize: 25,
            style: TeXStyle.text,
            color: Colors.black,
            blur: Blur(BlurStyle.normal, 0.34),
          ),
        )
      ],
    ),
  );
}