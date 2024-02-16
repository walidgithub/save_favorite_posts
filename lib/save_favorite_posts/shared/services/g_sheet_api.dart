import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _spreedSheetId =
      'posts-497@posts-414210.iam.gserviceaccount.com';
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "posts-414210",
  "private_key_id": "32d5b1a7c60d49e2ec1b26c61004f6f96b69cf45",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDTVJS7M/WjvA+T\ntKuUgf6OdUgLzUxkP3ddjR3N0RTmRf9A7UDHQXVRMpkSfnAB1P39Aqw4hmQnrdlO\nJgwtp9/PunpasVaJsLlUL2sG+NO2jwJXDK9yA/QJPSlMJT05pdP4oS+shIpdHQw7\njiJFfIFSeCI33NggJQf6iIVDU/lwVs/PkUg5uI/I46BXFqInQJiC0P/4LfxlXqWB\nRkg9S3uA5+bE7OW8UMpyIHBSmMbm5WZOfk43AM/dHxFapWqnlF1vQh41w/T552hF\nAXSmnHaYFBbSUfUYHiNzb1byhwzdAKtD65wyHqSVBSpdWtrlNmRulYtBgk36Jwiq\nrQjzJnF9AgMBAAECggEAARmzZY8ldAsOZLU/4HfV0L2VGLSitXHsJ/FMaq4wRuut\n4tNpbzAs0XWrPOCqKiRHB0p8hZXTjy5VT5YcoZ86Z90/dlnuiqyAJotRqhlhFtYD\nS9s9zaDuJB8sqCAYg8SUiDqkoigVhVsZnXTFwmldzgVgnjxY5r/ynPAZi4p0JczX\nf3XQQ4QpKi+ukTCj8xw2SlxGFSEgOYsaNd4/k6jYvF3esp/VhgE3nGdKQAw6S9ue\npNivvRlH/E5JYb/6T76mKKV7R3uG8s/XWqxhuUzH7PvA84N8M7smhrp460F4xPs8\nBDMnjod5DBCs6CXnUDHzBpdj0b0C5v3ZyDukakluYQKBgQDs/b3cdc7Tr1GUMclo\nzMjcTY+WKY2ojVn7E8Wff7gSo5B4qXtLjc08O0DFzvDOx9Fq5DtxFj/xt7uyKoTU\n37Dmxk6pnymSmggo+FL4Ri9jY9/kSvvl+AMBQL+3KCDRF1Tq0VgqsBOQrYjJIkbw\noyhrWEgpWlXEQ6ZChKwycK0D3QKBgQDkR+8CfgPa+N1wNCZMG4TAF5M53jlJZt7H\nVPcKtWGZ13LDceDkwh6Rr+o9q/67etnXboOw1zh1biOnLZthqekpi2aqENcza9he\n+9wi9/WgakUgItv+FYbHhET81GvXSGMsVfDWFQ6VeEqzghzCPJs3gmRUfbZ3VMoW\nKu+o/T6aIQKBgQCVbg0H9DRcX2A17AqODQnddv5BdaP/klkZKkdioZqEDiQrINpA\nMoIlJ0tZLnnCOFYAazZbwObC19H+rjahLwaRDJtO8q+442yfwKw4JbD9n1ztyqX4\nRCBI6vW3XBMNJAQEJ8nK6Mj9YZ4tDHLkikwTG1As2uvXW7x6lsMo7sj49QKBgQCu\nBchGdhoqS51Dc/3d9vx0E4TAkI/LTQh3nGXXW/5TcNKj+6Qdv33eQeSnrv45naWD\nfVQW83quyo+TWkkhYo3Eheh1rPDg2k3P2uAuKCivaVPY87oRMAfXARY2RxkOvLgd\njEZUbSj4+QK5ZW7XA6yv3E7vugXnYlPMIl8gzC11AQKBgQDaPCyaj2QQQaZlZCmd\n1w0M3jyYCS5cxdW17cAgZ7b/BTLYDFC0rVIUT+tfOD1s38AKzLO/SmzUJUoO7KSK\n5HSCCUA5+CJd8Rp5a4fR0d7xsNwbyAE0XRisovEBG/CLCEotwpUk7V8OuVmiM3X/\nhrNMRSTnAwrNhyTG2mLeAcqHow==\n-----END PRIVATE KEY-----\n",
  "client_email": "posts-497@posts-414210.iam.gserviceaccount.com",
  "client_id": "111382718363402546098",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/posts-497%40posts-414210.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';

  static final _gSheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadSheet = await _gSheets.spreadsheet(_spreedSheetId);
    _userSheet = await _getWorkSheet(spreadSheet, title: 'Users');
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try{
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
