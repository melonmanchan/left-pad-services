import static spark.Spark.*;
import com.google.gson.Gson;
import java.util.Map;
import java.util.HashMap;

public class Main {
    public static String leftPad(String str, int len, String ch) {
        StringBuffer padded = new StringBuffer(str);
        while (padded.length() < len) {
            padded.append(ch);
        }
        return padded.toString();
    }

    public static void main(String[] args) {
        port(3000);
        get("/", (req, res) -> {

            String str = req.queryParams("str");
            if (str == null) {
                str = "";
            }

            String ch = req.queryParams("ch");
            if (ch == null) {
                ch = "";
            }

            String lenString = req.queryParams("len");
            int len = 0;
            if (lenString != null) {
                len = Integer.parseInt(lenString);
            }

            res.type("application/json");
            Map resp = new HashMap();
            resp.put("str", leftPad(str, len, ch));
            return new Gson().toJson(resp);
        });
    }
}
