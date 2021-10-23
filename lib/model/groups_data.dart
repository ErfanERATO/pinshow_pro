class GroupData {
  final String name;
  final int id;
  final int serverId;
  final String inviteCode;
  final String privateStatus;
  final String defaultGroup;
  final String generatedCodeTime;
  final String expiredCodeTime;

  GroupData({
    required this.name,
    required this.id,
    required this.serverId,
    required this.inviteCode,
    required this.privateStatus,
    required this.defaultGroup,
    required this.generatedCodeTime,
    required this.expiredCodeTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serverId': serverId,
      'name': name,
      'inviteCode': inviteCode,
      'privateStatus': privateStatus,
      'defaultGroup': defaultGroup,
      'generatedCodeTime': generatedCodeTime,
      'expiredCodeTime': expiredCodeTime,
    };
  }

  @override
  String toString() {
    return 'GroupData{id: $id,'
        ' serverId: $serverId,'
        ' name: $name,'
        ' inviteCode: $inviteCode,'
        ' privateStatus:$privateStatus,'
        ' defaultGroup: $defaultGroup,'
        ' generatedCodeTime: $generatedCodeTime,'
        ' expiredCodeTime: $expiredCodeTime}';
  }
}
