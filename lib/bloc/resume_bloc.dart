import 'package:flutter_bloc/flutter_bloc.dart';
import 'resume_event.dart';
import 'resume_state.dart';
import '../services/resume_api.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  String pdfPath = '';
  String jobUrl = '';

  ResumeBloc() : super(ResumeInitial()) {
    on<UploadResumePDFEvent>((event, emit) {
      pdfPath = event.pdfPath;
      emit(ResumeUpdated(pdfPath)); // Emit new state to notify UI
    });

    on<UploadJobLinkEvent>((event, emit) => jobUrl = event.jobUrl);

    on<RewriteResumeEvent>((event, emit) async {
      emit(ResumeLoading());
      try {
        final outputPath = await ResumeApi.rewriteResume(pdfPath, jobUrl);
        emit(ResumeUpdated(outputPath));
      } catch (e) {
        emit(ResumeError("Failed: $e"));
      }
    });

    on<ClearResumeEvent>((event, emit) {
      pdfPath = ''; // Set to empty string instead of null.toString()
      jobUrl = ''; // Set to empty string instead of null.toString()
      emit(
        ResumeInitial(),
        // skipTransition: true,
      ); // Skip transition for immediate effect
    });
  }
}
