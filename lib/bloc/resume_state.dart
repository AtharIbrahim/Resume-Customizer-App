abstract class ResumeState {}

class ResumeInitial extends ResumeState {}

class ResumeLoading extends ResumeState {}

class ResumeUpdated extends ResumeState {
  final String outputPath;
  ResumeUpdated(this.outputPath);
}

class ResumeError extends ResumeState {
  final String message;
  ResumeError(this.message);
}
