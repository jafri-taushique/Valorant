
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:valorant/helper/api-helper/api.dart';

import '../data/agentData.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  late AgentData agentData1;
  @override
  void initState(){

    // apiCall()
    // log(agentData1.status.toString());
    // log(agentData1.data!.first.role!.displayName.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(" ", style: TextStyle(color: Colors.white70,fontSize: 42),),
      ),
    );
  }
   apiCall() async {
    agentData1 = await fetchAgentData();
  }
}
