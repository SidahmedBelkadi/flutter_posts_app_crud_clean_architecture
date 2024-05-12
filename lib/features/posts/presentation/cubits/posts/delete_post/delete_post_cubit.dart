import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostCubit() : super(DeletePostInitial());
}
