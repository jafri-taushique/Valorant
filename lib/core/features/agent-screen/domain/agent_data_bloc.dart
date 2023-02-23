import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../helper/api-helper/api.dart';
import '../data/agentData.dart';

part 'agent_data_event.dart';
part 'agent_data_state.dart';

class AgentDataBloc extends Bloc<AgentDataEvent, AgentDataState> {
  AgentDataBloc() : super(AgentDataLoading()) {
    on<FetchAgentData>((event, emit) async {
      try {
        emit(AgentDataLoading());
        AgentData agentData = await fetchAgentData();
        sortAgentData(agentData, emit);
      } catch (e) {
        log(e.toString());
        emit(AgentDataError(e.toString()));
      }
    });
  }

  void sortAgentData(AgentData agentData, Emitter<AgentDataState> emit) {
    List<Data> agentList = [];
    List<Data> initiatorList = [];
    List<Data> controllerList = [];
    List<Data> duelistList = [];
    List<Data> sentinelList = [];
    agentList = agentData.data!;
    agentData.data?.forEach((e) {
      if (e.role?.displayName == "Sentinel") {
        sentinelList.add(e);
      } else if (e.role?.displayName == "Initiator") {
        initiatorList.add(e);
      } else if (e.role?.displayName == "Controller") {
        controllerList.add(e);
      } else if (e.role?.displayName == "Duelist") {
        duelistList.add(e);
      }
    });
    emit(AgentDataLoaded(
        agentList, initiatorList, controllerList, duelistList, sentinelList));
  }
}
