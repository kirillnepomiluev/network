import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/ui/widgets/cards/app_cached_image.dart';
import 'package:provider/provider.dart';

class NftListScreen extends StatelessWidget {
  const NftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final nftList = walletProvider.nftList;
    return
      ListView.builder(
        shrinkWrap: true,
        itemCount: nftList.length,
        itemBuilder: (BuildContext context, int index) {
          return
            _NftCard(nft: nftList[index],);
        },
      );
  }
}

class _NftCard extends StatelessWidget {
  const _NftCard({Key? key, required this.nft}) : super(key: key);
  final NftModel nft;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double size = mediaWidth*0.4;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [

          SizedBox(
            width: size,
            height: size, // adjust the height as needed
            child: nft.imageUrl.isNotEmpty
                ? AppCachedImage(
              nft.imageUrl,
              fit: BoxFit.contain,
            )
                : const Center(
              child: Text('Img'),
            ),
          ),

          const SizedBox(width: 10,),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nft.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20,),

                Text(
                  nft.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
