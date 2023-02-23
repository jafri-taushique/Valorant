part of 'agent_data_bloc.dart';

@immutable
abstract class AgentDataState {}

class AgentDataInitial extends AgentDataState {}

class AgentDataLoading extends AgentDataState{}

class AgentDataLoaded extends AgentDataState{
  final List<Data> agentData;
  final List<Data> initiatorData;
  final List<Data> controllerData;
  final List<Data> duelistData;
  final List<Data> sentinelData;
  AgentDataLoaded(this.agentData, this.initiatorData, this.controllerData, this.duelistData, this.sentinelData);
}

class AgentDataError extends AgentDataState{
  final String errorMessage;
  AgentDataError(this.errorMessage);
}