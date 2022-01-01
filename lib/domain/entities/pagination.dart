import 'package:equatable/equatable.dart';

// Pagination Entity
class PaginationEntity extends Equatable {
  final int page;
  final int totalResults;
  final int totalPages;

  PaginationEntity({
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [
    page,
    totalResults,
    totalPages,
  ];

}