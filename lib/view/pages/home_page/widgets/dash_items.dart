// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleDashItems extends StatelessWidget {
  const SingleDashItems({
    Key? key,
    this.onPressed,
    required this.tittle,
    required this.subtitle,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String tittle;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://yt3.googleusercontent.com/ytc/AOPolaQZtjR_oGO-qUn-fYKrNNpzGPC1z9hojSuHQg112A=s900-c-k-c0x00ffffff-no-rj',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tittle),
                    Text(subtitle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
