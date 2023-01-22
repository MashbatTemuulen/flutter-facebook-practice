import 'package:equatable/equatable.dart';

abstract class CommonState extends Equatable {
  const CommonState();
}

class CommonInitial extends CommonState {
  const CommonInitial();

  @override
  List<Object?> get props => [];
}

class CommonLoading extends CommonState {
  const CommonLoading();

  @override
  List<Object?> get props => [];
}

class CommonFailure extends CommonState {
  final String message;
  const CommonFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CommonSuccess extends CommonState {
  const CommonSuccess();

  @override
  List<Object?> get props => [];
}
