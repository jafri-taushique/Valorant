import 'package:flutter/material.dart';
import 'package:valorant/core/features/agent-screen/data/agentData.dart';
import 'package:valorant/core/features/agent-screen/presentation/widget/ability_icon.dart';
import 'package:valorant/core/features/agent-screen/presentation/widget/agent_profile_avatar.dart';

class AgentProfile extends StatefulWidget {
  const AgentProfile({Key? key, required this.agentProfileData})
      : super(key: key);
  final Data agentProfileData;

  @override
  State<AgentProfile> createState() => _AgentProfileState();
}

class _AgentProfileState extends State<AgentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:widget.agentProfileData.backgroundGradientColors?? [ ],
              )
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgentProfileAvatar(
                  stackImage1: widget.agentProfileData.background ?? " ",
                  stackImage2: widget.agentProfileData.fullPortraitV2 ?? " ",

                      // widget.agentProfileData.backgroundGradientColors!
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "// Role",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.agentProfileData.role!.displayName ?? " ",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: NetworkImage(
                        widget.agentProfileData.role!.displayIcon ?? " "),
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "// Special Abilities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.agentProfileData.abilities!.length,
                        itemBuilder: (context, index) {
                          return AbilityIcon(
                              abilityIconImage: widget.agentProfileData
                                      .abilities![index].displayIcon ??
                                  " ");
                        })
                  ],
                ),
              )
            ],
        ),
          )),
    );
  }
}
