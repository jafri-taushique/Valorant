import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/core/features/agent-screen/domain/agent_data_bloc.dart';
import 'package:valorant/core/features/agent-screen/presentation/widget/agent_display_card.dart';
import 'package:valorant/helper/api-helper/api.dart';

import '../data/agentData.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen>
    with TickerProviderStateMixin {
  late AgentData agentData1;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Agents",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            // padding: EdgeInsets.only(bottom: 10),
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.red,
            tabs: const <Widget>[
              Tab(
                text: "All",
              ),
              Tab(
                text: "Duelists",
              ),
              Tab(
                text: "Controller",
              ),
              Tab(
                text: "Initiator",
              ),
              Tab(
                text: "Sentinel",
              )
            ],
          ),
        ),
        body: BlocBuilder<AgentDataBloc, AgentDataState>(
            builder: (BuildContext context, AgentDataState state) {
          print("........................${state}");
          if (State is AgentDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgentDataLoaded) {
            return  TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: ListView.builder(
                        itemCount: state.agentData.length,
                        itemBuilder: (context, index){
                      return
                        AgentDisplayCard(
                          agentData: state.agentData[index],
                        );

                    }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: ListView.builder(
                        itemCount: state.duelistData.length,
                        itemBuilder: (context, index){
                          return
                            AgentDisplayCard(agentData: state.duelistData[index],
                            );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: ListView.builder(
                        itemCount: state.controllerData.length,
                        itemBuilder: (context, index){
                          return
                            AgentDisplayCard(agentData: state.controllerData[index],
                            );

                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: ListView.builder(
                        itemCount: state.initiatorData.length,
                        itemBuilder: (context, index){
                          return
                            AgentDisplayCard(agentData: state.initiatorData[index],
                            );

                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: ListView.builder(
                        itemCount: state.sentinelData.length,
                        itemBuilder: (context, index){
                          return
                            AgentDisplayCard(
                              agentData: state.sentinelData[index],
                            );

                        }),
                  ),
                ],

            );
          } else if (state is AgentDataError) {
            return Container(
              margin: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Error Loading  ------------"),
            );
          }
          return Container(
            color: Colors.pinkAccent,
          );
        }),
      ),
    );
  }
}
