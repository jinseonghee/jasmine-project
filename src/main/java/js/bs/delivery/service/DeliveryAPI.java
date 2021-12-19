package js.bs.delivery.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import js.bs.delivery.vo.DeliveryVO;

@Service
public class DeliveryAPI {

	public List DeliveryInfo(String t_key, String t_code, String t_invoice) {

		List<DeliveryVO> Delivery = new ArrayList<DeliveryVO>();
		try {
			URL obj = new URL("https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=" + t_key + "&t_code=" + t_code + "&t_invoice=" + t_invoice);
			HttpURLConnection conn = (HttpURLConnection)obj.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line;
			String resultLine = "";
			while ((line = in.readLine()) != null) {
				resultLine += line;
			}
			in.close();

			if (resultLine != null) {

				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(resultLine);

				String itemName = element.getAsJsonObject().get("itemName").getAsString();
				JsonArray trackingDetails = element.getAsJsonObject().get("trackingDetails").getAsJsonArray();
				int size = trackingDetails.size();

				for (int i = 0; i < size; i++) {
					DeliveryVO deliVO = new DeliveryVO();
					String timeString = trackingDetails.get(i).getAsJsonObject().get("timeString").getAsString();
					String where = trackingDetails.get(i).getAsJsonObject().get("where").getAsString();
					String telno = trackingDetails.get(i).getAsJsonObject().get("telno").getAsString();
					String kind = trackingDetails.get(i).getAsJsonObject().get("kind").getAsString();
					deliVO.setTimeString(timeString);
					deliVO.setWhere(where);
					deliVO.setTelno(telno);
					deliVO.setKind(kind);
					Delivery.add(deliVO);
				}
			}
			return Delivery;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Delivery;
	}
}
