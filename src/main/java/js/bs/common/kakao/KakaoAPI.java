package js.bs.common.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoAPI {

	public String getAccessToken(String authorize_code) {

		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0d2976f52e2191eed8909314c41a95f8");
			sb.append("&redirect_uri=http://192.168.1.108:8088/jasmine/member/memberForm.do");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");

			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String kakao_id = element.getAsJsonObject().get("id").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();

			String memail[] = email.split("@");
			String email1 = memail[0];
			String email2 = memail[1];

			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
			String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
			String birthday_type = kakao_account.getAsJsonObject().get("birthday_type").getAsString();
			String birth_m = birthday.substring(0, 2);
			String birth_d = birthday.substring(2);

			userInfo.put("age_range", age_range);
			userInfo.put("kakao_id", kakao_id);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("email1", email1);
			userInfo.put("email2", email2);
			userInfo.put("gender", gender);
			userInfo.put("birthday", birthday);
			userInfo.put("birth_m", birth_m);
			userInfo.put("birth_d", birth_d);
			userInfo.put("birthday_type", birthday_type);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}
