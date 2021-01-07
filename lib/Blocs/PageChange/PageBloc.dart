import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/PageChange/PageEvent.dart';
import 'package:indoindians/Blocs/PageChange/PageState.dart';

class PageBloc extends Bloc<PageEvent , PageState> {
  PageBloc(PageState initialState) : super(initialState);
  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if(event is PageChange){
      yield* onPageChange(event);
    }
  }
  Stream<PageState> onPageChange(PageChange event) async* {
    yield OnPageChange(index : event.index);
  }
}