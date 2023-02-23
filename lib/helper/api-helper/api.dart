import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:valorant/core/features/agent-screen/data/agentData.dart';

Future<AgentData> fetchAgentData() async {
  final response = await http
      .get(Uri.parse('https://valorant-api.com/v1/agents'));

  if (response.statusCode == 200) {

    log("____________got response_____________");
    return AgentData.fromJson(jsonDecode(response.body));

  } else {

    throw Exception('Failed to load agents');
  }
}