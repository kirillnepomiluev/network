import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';


class WalletCurrencyData {

  WalletCurrencyData(this.title, this.subtitle, this.icon, this.iconSize);
  final String title;
  final String subtitle;
  final IconData icon;
  final double iconSize;

  static final List<WalletCurrencyData> currencyList = [
    WalletCurrencyData(
      'BTC',
      'Bitcoin',
      NetworkIcons.bitcoin,
      UtilsResponsive.getResSize(20),
    ), //20
    WalletCurrencyData(
        'SOL', 'Solana', NetworkIcons.sol, UtilsResponsive.getResSize(14),), //14
    WalletCurrencyData(
        'DASH', 'Dash', NetworkIcons.dash, UtilsResponsive.getResSize(15),), //15
    WalletCurrencyData(
        'ETH', 'Ethereum', NetworkIcons.eth, UtilsResponsive.getResSize(20),), //20
  ];

}