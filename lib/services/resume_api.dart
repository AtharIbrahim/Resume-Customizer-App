import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ResumeApi {
  static Future<String> rewriteResume(String pdfPath, String jobUrl) async {
    try {
      // Step 1: Extract text from PDF using alternative method
      final resumeText = await _extractTextFromPdf(pdfPath);

      // Step 2: Fetch job description from URL
      final jobDescription = await _fetchJobDescription(jobUrl);

      // Step 3: Call Mistral.ai API to rewrite resume
      final prompt = _createPrompt(resumeText, jobDescription);
      final rewrittenText = await _callMistralApi(prompt);

      // Step 4: Save as new PDF
      return await _createPdf(rewrittenText);
    } catch (e) {
      throw Exception('Failed to rewrite resume: ${e.toString()}');
    }
  }

  static Future<String> _extractTextFromPdf(String path) async {
    try {
      // Basic text extraction - reads the PDF as binary and looks for text patterns
      // This is a simple solution - consider using a proper PDF parsing service for production
      final file = File(path);
      final bytes = await file.readAsBytes();

      // Convert bytes to string (simple approach - may not work for all PDFs)
      String text = utf8.decode(bytes, allowMalformed: true);

      // Clean up the text (very basic - improves results for some PDFs)
      text = text.replaceAll(RegExp(r'[^\x20-\x7E]'), ' ');
      text = text.replaceAll(RegExp(r'\s+'), ' ');

      if (text.trim().isEmpty) {
        throw Exception('PDF appears to be empty or encrypted');
      }

      return text;
    } catch (e) {
      throw Exception('Failed to extract text from PDF: $e');
    }
  }

  static Future<String> _fetchJobDescription(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body
            .replaceAll(RegExp(r'<[^>]*>'), ' ')
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();
      }
      throw Exception(
        'Failed to fetch job description: ${response.statusCode}',
      );
    } catch (e) {
      return "Job posting at: $url";
    }
  }

  static String _createPrompt(String resumeText, String jobDescription) {
    return """
    Rewrite this resume to better match the following job description.
    Keep the same format but emphasize relevant skills and experiences.
    Only return the updated resume text, no additional commentary.
    
    RESUME:
    ${resumeText.length > 2000 ? resumeText.substring(0, 2000) + '...' : resumeText}
    
    JOB DESCRIPTION:
    ${jobDescription.length > 1000 ? jobDescription.substring(0, 1000) + '...' : jobDescription}
    """;
  }

  static Future<String> _callMistralApi(String prompt) async {
    const apiKey = 'Cf0tuXB3om4aopy3F0r7srbbc3bEBgYW';
    const apiUrl = 'https://api.mistral.ai/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'model': 'mistral-tiny',
      'messages': [
        {'role': 'user', 'content': prompt},
      ],
      'temperature': 0.7,
      'max_tokens': 2000,
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('API error: ${response.statusCode} - ${response.body}');
    }
  }

  static Future<String> _createPdf(String text) async {
    try {
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/custom_resume_${DateTime.now().millisecondsSinceEpoch}.txt',
      );
      await file.writeAsString(text);
      return file.path;
    } catch (e) {
      throw Exception('Failed to create output file: $e');
    }
  }
}


// Cf0tuXB3om4aopy3F0r7srbbc3bEBgYW