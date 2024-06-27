import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pickgenre_state.dart';

class PickgenreCubit extends Cubit<PickgenreState> {
  PickgenreCubit() : super(PickgenreInitial());
}
