abstract class ResumeEvent {}

class UploadResumePDFEvent extends ResumeEvent {
  final String pdfPath;
  UploadResumePDFEvent(this.pdfPath);
}

class UploadJobLinkEvent extends ResumeEvent {
  final String jobUrl;
  UploadJobLinkEvent(this.jobUrl);
}

class RewriteResumeEvent extends ResumeEvent {}

class ClearResumeEvent extends ResumeEvent {}
