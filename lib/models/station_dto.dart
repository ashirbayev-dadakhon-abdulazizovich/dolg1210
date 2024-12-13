class StationDto {
  final int id;
  final String name;
  final String color;

  StationDto({required this.id, required this.name, required this.color});

  factory StationDto.fromJson(Map<String, dynamic> json) {
    return StationDto(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }
}