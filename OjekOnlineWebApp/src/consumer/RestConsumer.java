package consumer;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class RestConsumer {
  private JSONObject output;
  private String APIURL;
  private String URLParameter;

  public RestConsumer(String URL, String URLParameter){
    output = new JSONObject();
    this.APIURL = URL;
    this.URLParameter = URLParameter;
  }

  public void execute(){
    try {
      /* Consuming API using GET method */
      String urlRequest = APIURL + URLParameter;
      URL obj = new URL(urlRequest);
      HttpURLConnection con = (HttpURLConnection) obj.openConnection();
      BufferedReader br = new BufferedReader(new InputStreamReader((con.getInputStream())));
      StringBuilder sb = new StringBuilder();
      String output1;
      while ((output1 = br.readLine()) != null) {
        sb.append(output1);
      }
      /* Parsing */
      String s = sb.toString();
      JSONParser parser = new JSONParser();
      output = (JSONObject) parser.parse(s);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  public void executePost(){
    try {
      URL obj = new URL(APIURL);
      HttpURLConnection con = (HttpURLConnection) obj.openConnection();
      con.setDoOutput( true );
      con.setRequestMethod( "POST" );
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      wr.writeBytes(URLParameter);
      wr.flush();
      wr.close();
      con.setReadTimeout(15*1000);
      con.connect();
      BufferedReader br = new BufferedReader(new InputStreamReader((con.getInputStream())));
      StringBuilder sb = new StringBuilder();
      String output1;
      while ((output1 = br.readLine()) != null) {
        sb.append(output1);
      }
      /* Parsing */
      JSONParser parser = new JSONParser();
      output = (JSONObject) parser.parse(sb.toString());
    } catch(Exception e){
      e.printStackTrace();
    }
  }

  public JSONObject getOutput(){
    return output;
  }
}