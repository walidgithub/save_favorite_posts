import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis/sheets/v4.dart' as sheets;

class CreateSpreadSheet {
  Future<String?> create(String title) async {
    // Load pre-authorized user credentials from the environment.
    // TODO(developer) - See https://developers.google.com/identity for
    // guides on implementing OAuth2 for your application.
    var client = await clientViaApplicationDefaultCredentials(scopes: [sheets.SheetsApi.driveScope]);
    var api = sheets.SheetsApi(client);
    try {
      var spreadsheet = sheets.Spreadsheet(properties: sheets.SpreadsheetProperties(title: title));
      var response = await api.spreadsheets.create(spreadsheet, $fields: 'spreadsheetId');
      print("Spreadsheet ID: ${response.spreadsheetId}");
      return response.spreadsheetId;
    } catch (e) {
      // TODO(developer) - handle error appropriately
      print('Message: ${e.toString()}');
      return null;
    }
  }

  // static Future<String?> createSpreadsheet(String title) async {
  //
  //   GoogleSignIn googleSignIn = GoogleSignIn();
  //   GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //   await googleSignInAccount!.authentication;
  //
  //   AuthCredential userCredential = GoogleAuthProvider.credential(
  //     idToken: googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken,
  //   );
  //
  //   // var credentials = await obtainAccessCredentialsViaApplicationDefault();
  //   var client = authenticatedClient(http.Client(), userCredential as AccessCredentials);
  //
  //   var sheetsApi = SheetsApi(client);
  //
  //   var spreadsheet = Spreadsheet()
  //     ..properties = (SpreadsheetProperties()..title = title);
  //   spreadsheet = await sheetsApi.spreadsheets.create(spreadsheet, $fields: 'spreadsheetId');
  //
  //   print('Spreadsheet ID: ${spreadsheet.spreadsheetId}');
  //   return spreadsheet.spreadsheetId;
  // }
}


