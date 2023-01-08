import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';


class NetworkRow extends StatelessWidget {
  final bool isRow;
  const NetworkRow({
    Key? key,
    required this.isRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRow == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.icons.handshake.image(
                width: 118,
                height: 118,
              ),
              const _Text(isColumn: true),
            ],
          )
        : Row(
            mainAxisAlignment: isRow ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.icons.handshake.image(
                width: 46,
                height: 46,
              ),
              const _Text(),
            ],
          );
  }
}

class _Text extends StatelessWidget {
  final bool isColumn;
  const _Text({
    Key? key, this.isColumn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(left: isColumn ? 0 : 15.0, top: isColumn ? 10 : 0),
          child: Text(
            'network',
            style: AppTextStyles.primary32.copyWith(fontWeight: FontWeight.w600),
          ),
        );
  }
}
