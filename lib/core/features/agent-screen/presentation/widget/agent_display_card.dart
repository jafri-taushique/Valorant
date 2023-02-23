import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:valorant/core/features/agent-screen/data/agentData.dart';
import 'package:valorant/core/features/agent-screen/presentation/agent_profile.dart';

class AgentDisplayCard extends StatelessWidget {
  const AgentDisplayCard({Key? key, required this.agentData})
      : super(key: key);
  final Data agentData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  AgentProfile(
          agentProfileData: agentData,
        )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 175,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: agentData.backgroundGradientColors?? []),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: agentData.fullPortrait.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(agentData.displayName!.toUpperCase(), style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 5,
                ),
                Text(agentData.role!.displayName!.toUpperCase(), style: const TextStyle(
                  fontSize: 16,
                ),),
              ],
            ),
            // SizedBox(
            //   height: 20,
            //   width: 20,
            //   child: CachedNetworkImage(
            //     imageUrl: agentData.role!.displayIcon.toString(),
            //     placeholder: (context, url) => const CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => const Icon(Icons.error),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
