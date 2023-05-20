import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';

abstract class IUsecase<Output, Input> {
  Future<Either<IFailures, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
